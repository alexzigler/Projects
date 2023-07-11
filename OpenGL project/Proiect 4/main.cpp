#include <windows.h> // for MS Windows
#include <GL/glut.h> // GLUT, include glu.h and gl.h
/* Global variables */

char title[] = "Rubix's Cube";
GLfloat angleCube = 0.0f; //initial angle set to 0
int refreshMills = 15;      //refresh rate
float a=0.0,b=0.0;      // x and y axis variables to translate
bool rot=1;              // bool variable for pausing the rotation
/* Initialize OpenGL Graphics */
void initGL() {
 glClearColor(1.0f, 1.0f, 1.0f, 1.0f); // Set background color to black and opaque
 glClearDepth(1.0f); // Set background depth to farthest
 glEnable(GL_DEPTH_TEST); // Enable depth testing for z-culling
 glDepthFunc(GL_LEQUAL); // Set the type of depth-test
 glShadeModel(GL_SMOOTH); // Enable smooth shading
 glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST); // Nice perspective corrections
 glEnable( GL_LINE_SMOOTH );
//glEnable( GL_POLYGON_SMOOTH );
//glHint( GL_LINE_SMOOTH_HINT, GL_NICEST );
//glHint( GL_POLYGON_SMOOTH_HINT, GL_NICEST );
//glEnable(GL_BLEND);
//glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

}
/* Handler for window-repaint event. Called back when the window first appears
and
 whenever the window needs to be re-painted. */
void display() {
 glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT); // Clear color and depth buffers
 glMatrixMode(GL_MODELVIEW); // To operate on model-view matrix
 // Render a color-cube consisting of 6 quads with different colors
 glLoadIdentity(); // Reset the model-view matrix
 glTranslatef(a, b, -7.0); // translates the cube on x and y axis depending on a and b, which are
                            // set in "timer" function using keys "wasd"
 glRotatef(angleCube, 0.9,1.0,0.9); // rotates the cube every frame by angleCube

 glBegin(GL_QUADS); // Begin drawing the color cube with 6 quads
 // Top face (y = 1.0f)
 // Define vertices in counter-clockwise (CCW) order with normal pointing out
 glColor3f(1.0, 1.0, 0.0); // Yellow
 glVertex3f( 1.0, 1.0, -1.0);
 glVertex3f(-1.0, 1.0, -1.0);
 glVertex3f(-1.0, 1.0, 1.0);
 glVertex3f( 1.0, 1.0, 1.0);
 // Bottom face (y = -1.0f)
 glColor3f(1.0, 1.0, 1.0); // white
 glVertex3f( 1.0, -1.0, 1.0);
 glVertex3f(-1.0, -1.0, 1.0);
 glVertex3f(-1.0, -1.0, -1.0);
 glVertex3f( 1.0, -1.0, -1.0);
 // Front face (z = 1.0f)
 glColor3f(1.0, 0.5, 0.0); // Orange
 glVertex3f( 1.0, 1.0, 1.0);
 glVertex3f(-1.0, 1.0, 1.0);
 glVertex3f(-1.0, -1.0, 1.0);
 glVertex3f( 1.0, -1.0, 1.0);
 // Back face (z = -1.0f)
 glColor3f(1.0, 0.0, 0.0); // red
 glVertex3f( 1.0, -1.0, -1.0);
 glVertex3f(-1.0, -1.0, -1.0);
 glVertex3f(-1.0, 1.0, -1.0);
 glVertex3f( 1.0, 1.0, -1.0);
 // Left face (x = -1.0f)
 glColor3f(0.0, 1.0, 0.0); // green
 glVertex3f(-1.0, 1.0, 1.0);
 glVertex3f(-1.0, 1.0, -1.0);
 glVertex3f(-1.0, -1.0, -1.0);
 glVertex3f(-1.0, -1.0, 1.0);
// Right face (x = 1.0f)
 glColor3f(0.0, 0.0, 1.0); // blue
 glVertex3f(1.0, 1.0, -1.0);
 glVertex3f(1.0, 1.0, 1.0);
 glVertex3f(1.0, -1.0, 1.0);
 glVertex3f(1.0, -1.0, -1.0);
 glEnd(); // End of drawing color-cube

 glLineWidth(3.0);
 glColor3f(0.0, 0.0, 0.0);
 glBegin(GL_QUADS);
 //black outline for orange face
 glVertex3f(-1.0,1.01,1.0);
 glVertex3f(-1.0,0.99,1.0);
 glVertex3f(1.0,0.99,1.0);
 glVertex3f(1.0,1.01,1.0);

 glVertex3f(-1.0,-0.99,1.0);
 glVertex3f(-1.0,-1.01,1.0);
 glVertex3f(1.0,-0.99,1.0);
 glVertex3f(1.0,-1.01,1.0);

 glVertex3f(-1.01,-1.0,1.0);
 glVertex3f(-0.99,-1.0,1.0);
 glVertex3f(-0.99,1.0,1.0);
 glVertex3f(-1.01,1.0,1.0);

 glVertex3f(0.99,1.0,1.0);
 glVertex3f(0.99,-1.0,1.0);
 glVertex3f(1.01,-1.0,1.0);
 glVertex3f(1.01,1.0,1.0);

 //black outline for red face
 glVertex3f(-1.0,1.01,-1.0);
 glVertex3f(-1.0,0.99,-1.0);
 glVertex3f(1.0,0.99,-1.0);
 glVertex3f(1.0,1.01,-1.0);

 glVertex3f(-1.0,-0.99,-1.0);
 glVertex3f(-1.0,-1.01,-1.0);
 glVertex3f(1.0,-0.99,-1.0);
 glVertex3f(1.0,-1.01,-1.0);

 glVertex3f(-1.01,-1.0,-1.0);
 glVertex3f(-0.99,-1.0,-1.0);
 glVertex3f(-0.99,1.0,-1.0);
 glVertex3f(-1.01,1.0,-1.0);

 glVertex3f(0.99,1.0,-1.0);
 glVertex3f(0.99,-1.0,-1.0);
 glVertex3f(1.01,-1.0,-1.0);
 glVertex3f(1.01,1.0,-1.0);
 // black outline for 2 green and 2 blue edges
 glVertex3f(1.0,-0.99,1.0);
 glVertex3f(1.0,-1.01,1.0);
 glVertex3f(1.0,-1.01,-1.0);
 glVertex3f(1.0,-0.99,-1.0);

 glVertex3f(1.0,1.01,1.0);
 glVertex3f(1.0,0.99,1.0);
 glVertex3f(1.0,0.99,-1.0);
 glVertex3f(1.0,1.01,-1.0);

 glVertex3f(-1.0,-0.99,1.0);
 glVertex3f(-1.0,-1.01,1.0);
 glVertex3f(-1.0,-1.01,-1.0);
 glVertex3f(-1.0,-0.99,-1.0);

 glVertex3f(-1.0,1.01,1.0);
 glVertex3f(-1.0,0.99,1.0);
 glVertex3f(-1.0,0.99,-1.0);
 glVertex3f(-1.0,1.01,-1.0);

 glEnd(); // end of black outline

 glBegin(GL_LINES);// black lines that divide every face
 //orange
glVertex3f (-0.33, -1.01, 1.0);
glVertex3f (-0.33, 1.01, 1.0);
glVertex3f (0.33, -1.01, 1.0);
glVertex3f (0.33, 1.01, 1.0);
glVertex3f (-1.01,0.33 , 1.0);
glVertex3f (1.01, 0.33 , 1.0);
glVertex3f (-1.01,-0.33 , 1.0);
glVertex3f (1.01,-0.33 , 1.0);
//red
glVertex3f (-0.33, -1.01, -1.0);
glVertex3f (-0.33, 1.01, -1.0);
glVertex3f (0.33, -1.01, -1.0);
glVertex3f (0.33, 1.01, -1.0);
glVertex3f (-1.01,0.33 , -1.0);
glVertex3f (1.01, 0.33 , -1.0);
glVertex3f (-1.01,-0.33 , -1.0);
glVertex3f (1.01,-0.33 , -1.0);
//white
glVertex3f (-0.33, -1.0, 1.01);
glVertex3f (-0.33, -1.0, -1.01);
glVertex3f (0.33, -1.0, 1.01);
glVertex3f (0.33, -1.0, -1.01);
glVertex3f ( 1.01,-1.0 ,-0.33);
glVertex3f (-1.01, -1.0, -0.33);
glVertex3f (1.01, -1.0, 0.33);
glVertex3f (-1.01, -1.0, 0.33);
//yellow
glVertex3f (-0.33, 1.0, 1.01);
glVertex3f (-0.33, 1.0, -1.01);
glVertex3f (0.33, 1.0, 1.01);
glVertex3f (0.33, 1.0, -1.01);
glVertex3f ( 1.01,1.0 ,-0.33);
glVertex3f (-1.01, 1.0, -0.33);
glVertex3f (1.01, 1.0, 0.33);
glVertex3f (-1.01, 1.0, 0.33);
//blue
glVertex3f (1.0, -0.33, 1.01);
glVertex3f (1.0,-0.33 , -1.01);
glVertex3f (1.0, 0.33, 1.01);
glVertex3f (1.0,0.33, -1.01);
glVertex3f (1.0, 1.01, -0.33);
glVertex3f (1.0, -1.01, -0.33);
glVertex3f (1.0, 1.01, 0.33);
glVertex3f (1.0,-1.01, 0.33);
//green
glVertex3f (-1.0, -0.33, 1.01);
glVertex3f (-1.0,-0.33 , -1.01);
glVertex3f (-1.0, 0.33, 1.01);
glVertex3f (-1.0,0.33, -1.01);
glVertex3f (-1.0, 1.01, -0.33);
glVertex3f (-1.0, -1.01, -0.33);
glVertex3f (-1.0, 1.01, 0.33);
glVertex3f (-1.0,-1.01, 0.33);
glEnd();
 glutSwapBuffers(); // Swap the front and back frame buffers (double buffering)
}
/* Handler for window re-size event. Called back when the window first appears
and whenever the window is re-sized with its new width and height */
void reshape(GLsizei width, GLsizei height) { // GLsizei for non-negative integer
 // Compute aspect ratio of the new window
 if (height == 0) height = 1; // To prevent divide by 0
 GLfloat aspect = (GLfloat)width / (GLfloat)height;
 // Set the viewport to cover the new window
 glViewport(0, 0, width, height);
 // Set the aspect ratio of the clipping volume to match the viewport
 glMatrixMode(GL_PROJECTION); // To operate on the Projection matrix
 glLoadIdentity(); // Reset
 // Enable perspective projection with fovy, aspect, zNear and zFar
 gluPerspective(45.0f, aspect, 0.1f, 100.0f);
}
void mouse(int button, int state, int x, int y) // set rot to false when the left mouse click is pressed
{                                               // and to true when the right click is pressed
switch (button) {
    case GLUT_LEFT_BUTTON:
        if (state == GLUT_DOWN)
            rot=false;
        break;
    case GLUT_RIGHT_BUTTON:
        if (state == GLUT_DOWN)
            rot=true;
        break;
    default: break;
}
}
void NormalKey (unsigned char key, int x, int y)
{               // increase and decrease a and b variables using "wasd"  keys
switch(key)
{
case 'w': b+=0.5;
break;
case 's': b-=0.5;
break;
case 'a': a-=0.5;
break;
case 'd': a+=0.5;
break;
}
}
void timer(int) {
 glutPostRedisplay(); // Post re-paint request to activate display()
 glutKeyboardFunc (NormalKey);
 glutMouseFunc(mouse);
 glutTimerFunc(refreshMills, timer, 0); // next timer call milliseconds later
 if(rot)            //pause the rotation if rot is false
 angleCube += 0.45f;
}
/* Main function: GLUT runs as a console application starting at main() */
int main(int argc, char** argv) {
 glutInit(&argc, argv); // Initialize GLUT
 glutInitDisplayMode(GLUT_DOUBLE); // Enable double buffered mode
 glutInitWindowSize(640, 480); // Set the window's initial width & height
 glutInitWindowPosition(50, 50); // Position the window's initial top-left corner
 glutCreateWindow(title); // Create window with the given title
 glutDisplayFunc(display); // Register callback handler for window repaint event
 glutReshapeFunc(reshape); // Register callback handler for window resize event
 initGL(); // Our own OpenGL initialization
 glutTimerFunc(refreshMills, timer, 0); // First timer call immediately
 glutMainLoop(); // Enter the infinite event-processing loop
 return 0;
}

