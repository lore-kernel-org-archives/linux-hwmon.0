Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:45061 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752389AbcKRXN1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Nov 2016 18:13:27 -0500
Date: Fri, 18 Nov 2016 15:13:23 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Matthew Weber <matthew.weber@rockwellcollins.com>
Cc: Jared Bents <jared.bents@rockwellcollins.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (amc6821) sign extension temperature
Message-ID: <20161118231323.GA30647@roeck-us.net>
References: <1479335033-44479-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20161116225103.GB11821@roeck-us.net>
 <CAM=7fbfQTOeXG-8oaQ7YDwR+Ji_R3VWM6TDrs9sU+UQqkh11wQ@mail.gmail.com>
 <20161117221813.GC23571@roeck-us.net>
 <CANQCQpbxTfomEsNvwm5LoJTKwK_4M+i+R79r-DU9_JMAEL7NRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANQCQpbxTfomEsNvwm5LoJTKwK_4M+i+R79r-DU9_JMAEL7NRw@mail.gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Nov 18, 2016 at 03:28:30PM -0600, Matthew Weber wrote:
> Guenter,
> 
> On Thu, Nov 17, 2016 at 4:18 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On Thu, Nov 17, 2016 at 02:08:41PM -0600, Jared Bents wrote:
> > > On Wed, Nov 16, 2016 at 4:51 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> > > > On Wed, Nov 16, 2016 at 04:23:53PM -0600, Matt Weber wrote:
> > > >> From: Jared Bents <jared.bents@rockwellcollins.com>
> > > >>
> > > >> Converts the unsigned temperature values from the i2c read
> > > >> to be sign extended as defined in the datasheet so that
> > > >> negative temperatures are properly read.
> > > >>
> > > >> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> > > >> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> > > >> ---
> > > >>  drivers/hwmon/amc6821.c | 2 +-
> > > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >>
> > > >> diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
> > > >> index 12e851a..d7368f7 100644
> > > >> --- a/drivers/hwmon/amc6821.c
> > > >> +++ b/drivers/hwmon/amc6821.c
> > > >> @@ -188,7 +188,7 @@ static struct amc6821_data *amc6821_update_device(struct device *dev)
> > > >>                       !data->valid) {
> > > >>
> > > >>               for (i = 0; i < TEMP_IDX_LEN; i++)
> > > >> -                     data->temp[i] = i2c_smbus_read_byte_data(client,
> > > >> +                     data->temp[i] = (int8_t) i2c_smbus_read_byte_data(client,
> > > >
> > > > How does that fix anything ? The only difference is that errors reported from
> > > > i2c_smbus_read_byte_data() are now capped off and stored as 0xff and no longer
> > > > as negative numbers.  I don't see how a value of 0xff read from the chip would
> > > > now be reported as -1 degrees C; it should be reported as 255 degrees C as it
> > > > was all along. What am I missing here ?
> > > >
> > > > A real fix would be to actually check for errors either here or in the show
> > > > function (temp[] < 0 indicates a transfer error), and to use sign_extend()
> > > > to convert the 8-bit reading to a signed value.
> > > >
> > > > Guenter
> > > >
> > >
> > > As stated in the patch note, the amc6821 uses signed numbers for the
> > > temperature values. 0xff is -1 Deg C and 0x80 is -128 Deg C via the
> > > temperature range table in the amc6821 datasheet.  This change does
> > > not break any error checking when reading the temperature over the i2c
> > > bus in this driver as this driver does not do any error checking for
> > > the temperature reads to begin with.  There are error checks in the
> > > driver but they are for some i2c writes and a few i2c reads for
> > > configuration settings.  None of those error checks are affected.
> > > Without this patch, the temperatures that are displayed in /sys/class
> > > when below 0 Deg C are 255 Deg C to 128 Deg C.  With the patch, the
> > > temperatures displayed below 0 Deg C are -1 Deg C to -128 Deg C as
> > > expected.
> > >
> > Ah, yes, it is "int8_t", which is extended to a negative number.
> > Sorry, I somehow read it as unsigned.
> >
> > Please run your patch through checkpatch --strict, fix what it reports,
> > and resubmit.
> 
> 
> I assume we fix errors but wanted to check on warnings as it looks
> like this file has a lot.
> 

That is not a reason to introduce new warnings and check messages
in a new patch. I did not ask you to fix all the checkpatch problems
in this file, only the ones reported in your patch.

Guenter
