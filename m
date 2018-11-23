Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from userp2130.oracle.com ([156.151.31.86]:39562 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727607AbeKXKNS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 24 Nov 2018 05:13:18 -0500
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
        "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-scsi@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-hwmon@vger.kernel.org,
        smartmontools-support@listi.jpberlin.de
Subject: Re: [PATCH v7] scsi: Add hwmon support for SMART temperature sensors
From: "Martin K. Petersen" <martin.petersen@oracle.com>
References: <20181118193729.25278-1-linus.walleij@linaro.org>
        <yq1va4q8hm9.fsf@oracle.com>
        <CACRpkdY2-JfpSP0=cpfzCrX2GYiChj2ZMC_i3k+9xH8kDnt7Ng@mail.gmail.com>
Date: Fri, 23 Nov 2018 18:26:28 -0500
In-Reply-To: <CACRpkdY2-JfpSP0=cpfzCrX2GYiChj2ZMC_i3k+9xH8kDnt7Ng@mail.gmail.com>
        (Linus Walleij's message of "Thu, 22 Nov 2018 14:49:53 +0100")
Message-ID: <yq1lg5j5qaj.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org


Hi Linus,

>> The problem with all this is that the storage topology is largely
>> undiscoverable for monitoring purposes. We can use heuristics, but in
>> many cases there is no reliable way to find out that there is an ATA
>> device behind member #3 of a USB-attached RAID controller's virtual disk
>> #5.
>
> OK I guess they just opt out of it?

There is no way to discover the actual topology in a vendor-agnostic
way. See all the -d options to smartctl and how discovery is left as an
exercise to the user in many cases :(

>> You could then argue that the kernel should only provide sensors for a
>> trivial subset of configurations such as direct-attached ATA/SAS/USB
>> devices that provide sufficient heuristics to ensure we don't
>> accidentally send commands down that may wedge the device.
>
> This is what the current patch does ... it's an opt-in per-subsystem.

Yep, but I'm afraid that may not be a good enough granularity. There are
tons of USB devices out there that wedge when you send them a command
they didn't expect (temperature sensor on a USB stick?). So there needs
to be some sort of heuristic in place. In this case the right way to
signal "I'm an ATA device" would be to provide the ATA Information VPD
page. Unfortunately, almost no USB/UAS/FireWire devices fill that out.

To solve other, similar headaches I have been toying with the idea of
teaching usb-storage/uas to present an intermediary libata-like SAT for
the primary (non-I/O) commands instead of relying on the device
implementation doing the right thing. This would clean up some of the
extensive blacklist/whitelist hacks we currently carry in SCSI due to
misbehaving devices.

> I just opted in libata PATA devices (pretty obvious this will work)
> and USB, and tested a bit with different devices there, nothing seems
> to break, the ATA disks behind USB transport works fine and
> report temperature just fine.

libata should be reasonably safe, USB & UAS definitely carry some risk.

>> (It's also worth noting that HDD temperature sensors are notoriously
>> unreliable).
>
> I am sorry if you think that D-Link does bad engineering, what I
> am trying to achieve is upstream support for this device, without
> any out-of-tree patches. The D-Link DIR-685 uses the harddisk
> sensor for this, whether we like it or not.

Sad, but not surprising.

Meanwhile elsewhere we have had drive vendors begging us to ignore the
reported temperature. We have measured in excess of 25 degC difference
between the drive PCB temp sensor and the sensor in the drive bay. We
have also had cases where the drives reported "lp0 on fire" despite the
bay temperature being nominal.

So I think it is imperative that no action is taken in response to the
drive-reported values without explicit opt-in from the user (or in your
NAS case maybe some device tree platform enablement). There is a reason
that all this S.M.A.R.T. stuff is disabled by default and left for the
admin to configure. S.M.A.R.T. and its properly standardized successors
have improved, but so far we have had way too many false positives to
entertain turning it on by default. I would absolutely love for things
to Just Work but unfortunately it hasn't been feasible to go there.

Taking a step back: You are doing this so that you can feed drive
temperature sensor data to hwmon from inside the kernel. Thought about
feeding it temperature data from smartctl in userland instead?  Just
wondering if the path of least resistance is leveraging the 70Klines of
existing temperature sensor reading heuristics that is smartmontools
(admittedly some of that is non-Linux support).

> I hope this is possible without having to buy and implement the same
> mechanism also for SCSI drives. I don't have any SCSI devices...

# modprobe scsi_debug
# sg_logs /dev/sda
    Linux     scsi_debug        0184
Supported log pages  (spc-2) [0x0]:
    0x00        Supported log pages
    0x0d        Temperature
    0x2f        Informational exceptions (SMART)

> Am I right in that the modepages for libata is the stuff inside
> drivers/ata/libata-scsi.c, like the stuff on the very top with the
> cache_mpage[] and def_control_mpage[]?

Essentially, yes. Except the temperature is in a log page and not a mode
(device configuration) page. Pretty much the same thing.

> These are all generated in response to the ata_scsiop_mode_sense()
> callback from ata_scsi_simulate() in response to MODE_SENSE and
> MODE_SENSE_10 commands.

Yeah, so you'd have to mirror this to implement LOG SENSE.

> - Add a case for LOG_SENSE (0x4d) in ata_scsi_simulate()
>
> - Prepare a callback and provide a mode page 0x0d from there.
>
> - Provide a modepage 0x0d in response to that command from SCSI.

Log page, yes.

> - Implement some code to request and deal with that modepage in
> drivers/scsi to register the hwmon sensor

Correct.

> Architecturally I see the upside of this, but I also see a problem:
> the modepage simulation would be useful not only for libata but also
> (as is proved by testing with USB cradles) from USB storage as
> well. But I guess I can figure that out, it's essentially just a piece
> of libata that USB need to share.

Yep, that's why I suggested making it a "libsmart" so that the code
could be leveraged by usb-storage/uas.

> The thing/command I pass in now is ATA_16 (0x85) 16-byte pass-thru, I
> take it that a ATA_16 pass thru is NOT a proper command or modepage
> but something like an uglyhack?...

ATA_16 is a pass-thru command defined in the T10 SAT (SCSI-ATA
Translation) specification. It acts as a conduit for sending an
encapsulated ATA command through a SCSI device.

You also need to add the ability to stop sending these commands if they
fail. Sending unsupported commands to a device can be quite disruptive
and impact performance for other I/O. So if the passthrough fails, you
should permanently disable the feature for that device. That's how we
usually deal with these things since there often isn't a way to
determine up front if something is going to work or not.

-- 
Martin K. Petersen	Oracle Linux Engineering
