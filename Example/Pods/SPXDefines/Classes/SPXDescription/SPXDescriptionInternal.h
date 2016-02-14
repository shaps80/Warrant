/*
   Copyright (c) 2015 Snippex. All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 1. Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 
 2. Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.
 
 THIS SOFTWARE IS PROVIDED BY Snippex `AS IS' AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
 EVENT SHALL Snippex OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


#ifndef _SPX_DESCRIPTION_INTERNALS_H
#define _SPX_DESCRIPTION_INTERNALS_H

#import "SPXDefinesCommon.h"


/**
 *  The macros below intentionally avoid using _SPXValidateKeyPath, since this would nest the keyPath solution which seems to remove syntax highlighting in Xcode
 */


#define _SPXKeyPathT(target_, keyPath_) (((void)(NO && ((void)target_.keyPath_, NO)), \
  _SPX_OBJC_STRINGIFY(keyPath_) \
))

#define _SPXDescriptionT(target_, ...) (((void)(NO && ((void)target_.description, NO)), \
  [super.description stringByAppendingFormat:@" %@", [[target_ dictionaryWithValuesForKeys:@[ __VA_ARGS__ ]] description]] \
))


#endif

