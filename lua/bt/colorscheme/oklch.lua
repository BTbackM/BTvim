local M = {}

local function clamp(value, min, max)
	return math.min(max, math.max(min, value))
end

local function linear_to_srgb(value)
	value = clamp(value, 0, 1)

	if value <= 0.0031308 then
		return 12.92 * value
	end

	return 1.055 * value ^ (1 / 2.4) - 0.055
end

-- Convert OKLCH through OKLab and linear sRGB to a Neovim-compatible hex color.
function M.to_hex(lightness, chroma, hue)
	local hue_radians = math.rad(hue)
	local a = chroma * math.cos(hue_radians)
	local b = chroma * math.sin(hue_radians)

	local l_ = lightness + 0.3963377774 * a + 0.2158037573 * b
	local m_ = lightness - 0.1055613458 * a - 0.0638541728 * b
	local s_ = lightness - 0.0894841775 * a - 1.2914855480 * b

	local l = l_ ^ 3
	local m = m_ ^ 3
	local s = s_ ^ 3

	local red = 4.0767416621 * l - 3.3077115913 * m + 0.2309699292 * s
	local green = -1.2684380046 * l + 2.6097574011 * m - 0.3413193965 * s
	local blue = -0.0041960863 * l - 0.7034186147 * m + 1.7076147010 * s

	return string.format(
		"#%02X%02X%02X",
		math.floor(linear_to_srgb(red) * 255 + 0.5),
		math.floor(linear_to_srgb(green) * 255 + 0.5),
		math.floor(linear_to_srgb(blue) * 255 + 0.5)
	)
end

function M.from_string(expression)
	local arguments = expression:match("^oklch%((.+)%)$")
	if not arguments then
		return nil
	end

	local values = {}
	for argument in arguments:gmatch("[^,]+") do
		if #values == 3 then
			return nil
		end

		local value = tonumber(argument)
		if value == nil then
			return nil
		end

		values[#values + 1] = value
	end

	if #values ~= 3 then
		return nil
	end

	return M.to_hex(values[1], values[2], values[3])
end

return M
