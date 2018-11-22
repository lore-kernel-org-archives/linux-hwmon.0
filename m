Return-Path: <linus.walleij@linaro.org>
Return-path: <linus.walleij@linaro.org>
MIME-Version: 1.0
References: <20181118193729.25278-1-linus.walleij@linaro.org> <yq1va4q8hm9.fsf@oracle.com>
In-Reply-To: <yq1va4q8hm9.fsf@oracle.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 22 Nov 2018 14:49:53 +0100
Message-ID: <CACRpkdY2-JfpSP0=cpfzCrX2GYiChj2ZMC_i3k+9xH8kDnt7Ng@mail.gmail.com>
Subject: Re: [PATCH v7] scsi: Add hwmon support for SMART temperature sensors
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, Guenter Roeck <linux@roeck-us.net>,
	linux-scsi@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-hwmon@vger.kernel.org, smartmontools-support@listi.jpberlin.de
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-hwmon@vger.kernel.org>

On Wed, Nov 21, 2018 at 6:28 PM Martin K. Petersen
<martin.petersen@oracle.com> wrote:

> The problem with all this is that the storage topology is largely
> undiscoverable for monitoring purposes. We can use heuristics, but in
> many cases there is no reliable way to find out that there is an ATA
> device behind member #3 of a USB-attached RAID controller's virtual disk
> #5.

OK I guess they just opt out of it?

> You could then argue that the kernel should only provide sensors for a
> trivial subset of configurations such as direct-attached ATA/SAS/USB
> devices that provide sufficient heuristics to ensure we don't
> accidentally send commands down that may wedge the device.

This is what the current patch does ... it's an opt-in per-subsystem.
I just opted in libata PATA devices (pretty obvious this will work)
and USB, and tested a bit with different devices there, nothing seems
to break, the ATA disks behind USB transport works fine and
report temperature just fine.

> I.e. repicate
> smartmontools' heuristics inside the kernel. That's a valid position but
> I remain unconvinced that it's worth it. Do you have specific user cases
> other than this particular RAID box without enclosure sensors?

It is not a RAID box at all. It is a simple NAS with a single disk.
I just slot in a 1 terabyte drive and use as home NAS.

> (It's
> also worth noting that HDD temperature sensors are notoriously
> unreliable).

I am sorry if you think that D-Link does bad engineering, what I
am trying to achieve is upstream support for this device, without
any out-of-tree patches. The D-Link DIR-685 uses the harddisk
sensor for this, whether we like it or not.

> And finally, from an implementation perspective, both James and Doug
> pointed you to SAT and the SCSI Temperature Log Page. libata is our
> SAT. And thus the S.M.A.R.T. bits should be located in a libsmart
> library that libata and USB can use to fill out the SCSI Temperature Log
> Page. The hwmon-facing code would then use that log page instead of
> dissecting S.M.A.R.T. information directly.

I hope this is possible without having to buy and implement
the same mechanism also for SCSI drives. I don't have any
SCSI devices...

Initially James asked me to move this from libata to
scsi with this argument:

James Bottomley wrote

> Given that you're using scsi_execute and this would work on most SAS
> drives as well as SATA ones, why not use the SAS mode pages and we'll
> translate it to SATA in the existing libata-scsi SAT?
>
> That way this can work on all SCSI devices that support SMART not just
> the SATA subset.
>
> If you can't figure out how to do this initially, then simply
> separating smart from libata is a good first start so we can build on
> it in SCSI as well.

So I *think* I went ahead and implemented according to
statement (3) since I have no idea of how to do SAS mode
pages

I did move it over and made subsystems opt into it.

But I can try harder of course!

Douglas Gilbert said:

> Fetch the SCSI Temperature Log page [0xd] with the
> LOG SENSE SCSI command.
> See sat5r01a.pdf chapter 10.3.8 for how that should be translated
> to ATA commands by libata and other SATLs.

Am I right in that the modepages for libata is the stuff inside
drivers/ata/libata-scsi.c, like the stuff on the very top with the
cache_mpage[] and def_control_mpage[]?

These are all generated in response to the
ata_scsiop_mode_sense() callback from
ata_scsi_simulate() in response to MODE_SENSE
and MODE_SENSE_10 commands.

As far as I understand, MODE_SENSE is what we
should be using, correct?

I guess I should:

- Add a case for LOG_SENSE (0x4d) in
  ata_scsi_simulate()

- Prepare a callback and provide a mode
  page 0x0d from there.

- Provide a modepage 0x0d in response to that
  command from SCSI.

- Implement some code to request and deal with that
  modepage in drivers/scsi to register the hwmon
  sensor

So what about I try to do that... without a SCSI
device to test it on, just a simulated one through
libata. This will be fun, but I BET the SCSI people
will help me testing it :)

Architecturally I see the upside of this, but I also see
a problem: the modepage simulation would be useful
not only for libata but also (as is proved by testing with
USB cradles) from USB storage as well. But I guess
I can figure that out, it's essentially just a piece of
libata that USB need to share. I can certainly start
with just ATA.

The thing/command I pass in now is ATA_16 (0x85)
16-byte pass-thru, I take it that a ATA_16 pass thru
is NOT a proper command or modepage but
something like an uglyhack?...

Yours,
Linus Walleij
