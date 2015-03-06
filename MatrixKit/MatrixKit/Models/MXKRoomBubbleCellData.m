/*
 Copyright 2015 OpenMarket Ltd

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "MXKRoomBubbleCellData.h"

@implementation MXKRoomBubbleCellData
@synthesize senderId, attributedTextMessage;

- (instancetype)initWithEvent:(MXEvent *)event andRoomState:(MXRoomState *)roomState {
    self = [self init];
    if (self) {
        // @TODO
        senderId = event.userId;
        attributedTextMessage = [event.eventId substringToIndex:5];
    }
    return self;
}

- (BOOL)addEvent:(MXEvent *)event andRoomState:(MXRoomState *)roomState {
    BOOL contatenated = NO;

    // Group events only if they come from the same sender
    if ([event.userId isEqualToString:senderId]) {

        attributedTextMessage = [NSString stringWithFormat:@"%@, %@", attributedTextMessage, [event.eventId substringToIndex:5]];
        [attributedTextMessage stringByAppendingString:event.eventId];
        contatenated = YES;
    }
    return contatenated;
}

@end
