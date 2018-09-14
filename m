Return-Path: <dgilbert@interlog.com>
Return-path: <dgilbert@interlog.com>
Reply-To: dgilbert@interlog.com
Subject: Re: [PATCH v4] libata: Add hwmon support for SMART temperature
 sensors
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 Linus Walleij <linus.walleij@linaro.org>, Jens Axboe <axboe@kernel.dk>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-ide@vger.kernel.org, linux-hwmon@vger.kernel.org,
 smartmontools-support@listi.jpberlin.de,
 linux-scsi <linux-scsi@vger.kernel.org>
References: <20180913142217.17579-1-linus.walleij@linaro.org>
 <1536949216.3531.35.camel@HansenPartnership.com>
From: Douglas Gilbert <dgilbert@interlog.com>
Message-ID: <e669e4ff-a09f-0bfd-4a52-22a5f66487a2@interlog.com>
Date: Fri, 14 Sep 2018 15:38:36 -0400
MIME-Version: 1.0
In-Reply-To: <1536949216.3531.35.camel@HansenPartnership.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

On 2018-09-14 02:20 PM, James Bottomley wrote:
> On Thu, 2018-09-13 at 16:22 +0200, Linus Walleij wrote:
> [...]
>> +	/* Send ATA command to read SMART values */
>> +	memset(scsi_cmd, 0, sizeof(scsi_cmd));
>> +	scsi_cmd[0] = ATA_16;
>> +	scsi_cmd[1] = (4 << 1); /* PIO Data-in */
>> +	/*
>> +	 * No off.line or cc, read from dev, block count in sector
>> count
>> +	 * field.
>> +	 */
>> +	scsi_cmd[2] = 0x0e;
>> +	scsi_cmd[4] = ATA_SMART_READ_VALUES;
>> +	scsi_cmd[6] = 1; /* Read 1 sector */
>> +	scsi_cmd[8] = 0; /* args[1]; */
>> +	scsi_cmd[10] = ATA_SMART_LBAM_PASS;
>> +	scsi_cmd[12] = ATA_SMART_LBAH_PASS;
>> +	scsi_cmd[14] = ATA_CMD_SMART;
>> +
>> +	cmd_result = scsi_execute(ata->sdev, scsi_cmd,
>> DMA_FROM_DEVICE,
>> +				  buf, ATA_SECT_SIZE,
>> +				  NULL, &sshdr, 10 * HZ, 5, 0, 0,
>> NULL);
> 
> Given that you're using scsi_execute and this would work on most SAS
> drives as well as SATA ones, why not use the SAS mode pages and we'll
> translate it to SATA in the existing libata-scsi SAT?

Fetch the SCSI Temperature Log page [0xd] with the LOG SENSE SCSI command.
See sat5r01a.pdf chapter 10.3.8 for how that should be translated
to ATA commands by libata and other SATLs.

Doug Gilbert

> That way this can work on all SCSI devices that support SMART not just
> the SATA subset.
> 
> If you can't figure out how to do this initially, then simply
> separating smart from libata is a good first start so we can build on
> it in SCSI as well.
> 
> James
> 
> 
