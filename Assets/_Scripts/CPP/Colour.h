#ifndef COLOUR_H
#define COLOUR_H
class Colour
{
    private: OBJCColour* wrapped;
    public: OBJCColour* Wrapped(){return this->wrapped;}

    public: Colour(float r, float g, float b, float a)
    {
      this->wrapped = [[OBJCColour alloc]colourWithRedFloat:r green:g blue:b alpha:a];
    }

    public: Colour(int r, int g, int b, int a)
    {
      this->wrapped = [[OBJCColour alloc]colourWithRedInt:r green:g blue:b alpha:a];
    }
};
#endif
