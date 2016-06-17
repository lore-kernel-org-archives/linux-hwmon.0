Return-path: <afd@ti.com>
Subject: Re: [PATCH v5 1/1] hwmon: Add support for INA3221 Triple
 Current/Voltage Monitors
To: Guenter Roeck <linux@roeck-us.net>
References: <20160610153233.6169-1-afd@ti.com>
 <20160610153233.6169-2-afd@ti.com> <20160610164435.GA9125@roeck-us.net>
CC: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        Laxman
 Dewangan <ldewangan@nvidia.com>, <linux-hwmon@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <5764860E.1040305@ti.com>
Date: Fri, 17 Jun 2016 18:21:50 -0500
MIME-Version: 1.0
In-Reply-To: <20160610164435.GA9125@roeck-us.net>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On 06/10/2016 11:44 AM, Guenter Roeck wrote:
> On Fri, Jun 10, 2016 at 10:32:33AM -0500, Andrew F. Davis wrote:
>> Add support for the the INA3221 26v capable, Triple channel,
>> Bi-Directional, Zero-Drift, Low-/High-Side, Current/Voltage Monitor
>> with I2C interface.
>>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
> 
> Applied to -next.
> 
> Can you by any chance send me a register dump ? I would like to write
> module test code for the chip.
> 

No problem:

# i2cdump -y 2 0x48
No size specified (using byte-data access)
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: 18 16 80 00 08 7f 80 7f 80 00 00 00 00 00 00 00    ???.?????.......
10: e0 00 00 f0 00 00 03 00 00 7f 00 00 00 00 00 00    ?..?..?..?......
20: 7f 0a 01 00 00 XX 00 00 00 00 0e 00 00 00 40 00    ???..X....?...@.
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 55 00    ..............U.
