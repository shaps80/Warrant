/*
   Copyright (c) 2014 Shaps Mohsenin. All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:

 1. Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.

 2. Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.

 THIS SOFTWARE IS PROVIDED BY Shaps Mohsenin `AS IS' AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
 EVENT SHALL Shaps Mohsenin OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "time.h"
#import "stdlib.h"

#import "SPXLoggingInternal.h"


/*
 Format
 
 %a	Abbreviated weekday name *	Thu
 %A	Full weekday name *	Thursday
 %b	Abbreviated month name *	Aug
 %B	Full month name *	August
 %c	Date and time representation *	Thu Aug 23 14:55:02 2001
 %C	Year divided by 100 and truncated to integer (00-99)	20
 %d	Day of the month, zero-padded (01-31)	23
 %D	Short MM/DD/YY date, equivalent to %m/%d/%y	08/23/01
 %e	Day of the month, space-padded ( 1-31)	23
 %F	Short YYYY-MM-DD date, equivalent to %Y-%m-%d	2001-08-23
 %g	Week-based year, last two digits (00-99)	01
 %G	Week-based year	2001
 %h	Abbreviated month name * (same as %b)	Aug
 %H	Hour in 24h format (00-23)	14
 %I	Hour in 12h format (01-12)	02
 %j	Day of the year (001-366)	235
 %m	Month as a decimal number (01-12)	08
 %M	Minute (00-59)	55
 %n	New-line character ('\n')
 %p	AM or PM designation	PM
 %r	12-hour clock time *	02:55:02 pm
 %R	24-hour HH:MM time, equivalent to %H:%M	14:55
 %S	Second (00-61)	02
 %t	Horizontal-tab character ('\t')
 %T	ISO 8601 time format (HH:MM:SS), equivalent to %H:%M:%S	14:55:02
 %u	ISO 8601 weekday as number with Monday as 1 (1-7)	4
 %U	Week number with the first Sunday as the first day of week one (00-53)	33
 %V	ISO 8601 week number (00-53)	34
 %w	Weekday as a decimal number with Sunday as 0 (0-6)	4
 %W	Week number with the first Monday as the first day of week one (00-53)	34
 %x	Date representation *	08/23/01
 %X	Time representation *	14:55:02
 %y	Year, last two digits (00-99)	01
 %Y	Year	2001
 %z	ISO 8601 offset from UTC in timezone (1 minute=1, 1 hour=100)
 If timezone cannot be termined, no characters	+100
 %Z	Timezone name or abbreviation *
 If timezone cannot be termined, no characters	CDT
 %%	A % sign	%
 
 Modifiers
 
 E	Uses the locale's alternative representation, applies to    %Ec %EC %Ex %EX %Ey %EY
 O	Uses the locale's alternative numeric symbols, applies to   %Od %Oe %OH %OI %Om %OM %OS %Ou %OU %OV %Ow %OW %Oy
 */

char * getTime()
{
  time_t rawtime;
  struct tm * timeinfo;
  char buffer[80];
  
  time (&rawtime);
  timeinfo = localtime (&rawtime);
  
  // see format strings above - YYYY-MM-DD HH:MM:SS
  strftime(buffer, sizeof(buffer), "%F %T", timeinfo);
  
  char *time;
  time=(char *)malloc(64);
  strcpy(time, buffer);
  
  return time;
}

