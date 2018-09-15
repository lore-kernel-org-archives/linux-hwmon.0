Return-Path: <Christian.Franke@t-online.de>
Return-path: <Christian.Franke@t-online.de>
From: Christian Franke <Christian.Franke@t-online.de>
Subject: Re: [smartmontools-support] [PATCH v4] libata: Add hwmon support for
 SMART temperature sensors
To: dgilbert@interlog.com,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Linus Walleij <linus.walleij@linaro.org>, Jens Axboe <axboe@kernel.dk>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-ide@vger.kernel.org,
 smartmontools-support@listi.jpberlin.de,
 linux-scsi <linux-scsi@vger.kernel.org>
References: <20180913142217.17579-1-linus.walleij@linaro.org>
 <1536949216.3531.35.camel@HansenPartnership.com>
 <e669e4ff-a09f-0bfd-4a52-22a5f66487a2@interlog.com>
Message-ID: <66afc39a-b90a-7dc1-fc56-c9cd033e54de@t-online.de>
Date: Sat, 15 Sep 2018 18:38:59 +0200
MIME-Version: 1.0
In-Reply-To: <e669e4ff-a09f-0bfd-4a52-22a5f66487a2@interlog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

Douglas Gilbert wrote:
> On 2018-09-14 02:20 PM, James Bottomley wrote:
>> ...
>> Given that you're using scsi_execute and this would work on most SAS
>> drives as well as SATA ones, why not use the SAS mode pages and we'll
>> translate it to SATA in the existing libata-scsi SAT?
>
> Fetch the SCSI Temperature Log page [0xd] with the LOG SENSE SCSI 
> command.
> See sat5r01a.pdf chapter 10.3.8 for how that should be translated
> to ATA commands by libata and other SATLs.

Please note that SAT requires other access methods than the patch 
implements.

A comparison of ATA access methods for temperature:

1) ATA SMART Attribute 194 (from vendor specific SMART DATA):
- Provides: current temperature, possibly lifetime(?) min/max in various 
formats.
- Standards:
-- SMART READ DATA cmd: ATA-3 to ACS-3, no longer documented in ACS-4.
-- Attribute 194: "existing practice", not mentioned in any related 
standard,
- Supported by: virtually all HDD/SSD with temperature sensor.
- Used by: this patch, smartctl/smartd, most other disk monitoring tools.

2) ATA SCT Status (GP/SMART log address 0xe0):
- Provides: current temperature, power cycle min/max, lifetime min/max, 
over/under limit count.
- Standards: ATA-8 ACS or later.
- Supported by: various devices since ~2006, still unsupported by some 
recent devices.
- Used by: SAT-4 or later, smartctl 5.38+, ...?

3) ATA Temperature Statistics (GP log address 0x04, page 0x05):
- Provides current temperature, lifetime min/max, over/under limit time, ...
- Standards: ATA ACS-2 or later.
- Supported by: few devices since ~2010, still unsupported by many 
recent devices.
- Used by: SAT-3 or later, smartctl 5.42+, ...?

Interestingly SAT-4 adds the older SCT access method.

Christian
