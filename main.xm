//
// DuoGamerSDK Test tool 
//
#import "DuoGamerSDK.h"
#import <ExternalAccessory/ExternalAccessory.h>

// Minimal hook to use accessory without an application bundle that defines the supported ExternalAccessories
// For (AppStore) apps, this is neither neccessary nor recommended.
%hook EAAccessoryManager
-(BOOL)appDeclaresProtocol:(NSString*)protocolString{
    return YES;
}
%end

// print duo gamer state
@interface DuoGamerTest : NSObject<DuoGamerDelegate>
@end

@implementation DuoGamerTest
-(void) connected {
  NSLog(@"DuoGamerTest: connected");
}  
-(void) disconnected {
  NSLog(@"DuoGamerTest: disconnected");
}  
-(void) handleState:(DuoGamerState*)state {
    NSLog(@"DuoGamerTest: DPad L%u R%u U%u D%u, Buttons A%u B%u X%u Y%u, AnalogLeft %d/%d AnalogRight %d/%d",
        state->dpadLeft, state->dpadRight, state->dpadUp, state->dpadDown,
        state->buttonA, state->buttonB, state->buttonX, state->buttonY,
        state->analogLeftX, state->analogLeftY, state->analogRightX, state->analogRightY);
}
@end

int main(int argc, char **argv, char **envp) {
    DuoGamer * manager = [DuoGamer new];
    manager.delegate = [DuoGamerTest new];
    CFRunLoopRun();
}
// vim:ft=objc