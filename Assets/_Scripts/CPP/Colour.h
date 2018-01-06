#ifndef COLOUR_H
#define COLOUR_H
class Colour
{
    private: NSColor* wrapped;
    public: NSColor* Wrapped(){return this->wrapped;}

    public: Colour(float r, float g, float b, float a)
    {
      this->wrapped = [OBJCColour colourWithRedFloat:r green:g blue:b alpha:a];
    }

    public: Colour(int r, int g, int b, int a)
    {
      this->wrapped = [OBJCColour colourWithRedInt:r green:g blue:b alpha:a];
    }
};
#endif
