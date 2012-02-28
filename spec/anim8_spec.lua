require 'spec.love-mocks'

local anim8 = require 'anim8'

local lgnq = love.graphics.newQuad


describe("anim8", function()
  describe("newGrid", function()
    it("throws error if any of its parameters is not a positive integer", function()
      assert_error(function() anim8.newGrid() end)
      assert_error(function() anim8.newGrid(1) end)
      assert_error(function() anim8.newGrid(1,1,1,-1) end)
      assert_error(function() anim8.newGrid(0,1,1,1) end)
      assert_error(function() anim8.newGrid(1,1,'a',1) end)
    end)

    it("preserves the values", function()
      local g = anim8.newGrid(1,2,3,4)
      assert_equal(1, g.frameWidth)
      assert_equal(2, g.frameHeight)
      assert_equal(3, g.imageWidth)
      assert_equal(4, g.imageHeight)
    end)

    it("calculates width and height", function()
      local g = anim8.newGrid(32,32,64,256)
      assert_equal(2, g.width)
      assert_equal(8, g.height)
    end)
  end)

  describe("Grid", function()
    describe("getFrames", function()
      local g, quad
      before(function()
        g = anim8.newGrid(16,16,64,64)
        quad = function(x,y) return lgnq(x,y, 16,16, 64,64) end
      end)

      describe("with 2 integers", function()
        it("returns a single frame", function()
          assert_equal(quad(0,0), g:getFrames(1,1)[1])
        end)
        it("returns another single frame", function()
          assert_equal(quad(32,16), g:getFrames(3,2)[1])
        end)
        it("throws an error if the frame does not exist", function()
          assert_error(function() g:getFrames(10,10) end)
        end)



      end)
    end)
  end)
end)
