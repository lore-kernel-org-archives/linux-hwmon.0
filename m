Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-vk0-f48.google.com ([209.85.213.48]:32875 "EHLO
	mail-vk0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751705AbcFWQmF (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Thu, 23 Jun 2016 12:42:05 -0400
Received: by mail-vk0-f48.google.com with SMTP id d185so114377461vkg.0
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Jun 2016 09:42:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFHUOYwva_mry+gKKEsFaBw-L2ey-HHPetjDGqkr0hwcmw_zEw@mail.gmail.com>
References: <1463415447-29903-1-git-send-email-hotran@apm.com>
 <1463415447-29903-2-git-send-email-hotran@apm.com> <20160523203044.GA17450@rob-hp-laptop>
 <CAFHUOYyYt8pE6sggezCR=TFcsimcjakbYmcWFtpLyQ3Et_gZaA@mail.gmail.com>
 <CABb+yY3uFrknEU65aBCw7G+dfnDdqGTZ_sctktx03GM9b86xaA@mail.gmail.com> <CAFHUOYwva_mry+gKKEsFaBw-L2ey-HHPetjDGqkr0hwcmw_zEw@mail.gmail.com>
From: Hoan Tran <hotran@apm.com>
Date: Thu, 23 Jun 2016 09:42:02 -0700
Message-ID: <CAFHUOYy7G85O0DiqNds2DJtbg_EZzRE0NjS=7V0gKSEsyQJ8Ow@mail.gmail.com>
Subject: Re: [PATCH 1/3] Documentation: dtb: xgene: Add hwmon dts binding documentation
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Ashwin Chaugule <ashwin.chaugule@linaro.org>,
	Duc Dang <dhdang@apm.com>, Loc Ho <lho@apm.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	lkml <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Devicetree List <devicetree@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Jun 7, 2016 at 11:05 AM, Hoan Tran <hotran@apm.com> wrote:
> Hi Jassi,
>
> Thanks for your reply !
>
> On Tue, Jun 7, 2016 at 10:20 AM, Jassi Brar <jassisinghbrar@gmail.com> wrote:
>> On Tue, May 24, 2016 at 6:31 AM, Hoan Tran <hotran@apm.com> wrote:
>>> Hi Rob,
>>>
>>> Thanks for your review !
>>>
>>> On Mon, May 23, 2016 at 1:30 PM, Rob Herring <robh@kernel.org> wrote:
>>>>
>>>> On Mon, May 16, 2016 at 09:17:25AM -0700, Hoan Tran wrote:
>>>> > This patch adds the APM X-Gene hwmon device tree node documentation.
>>>> >
>>>> > Signed-off-by: Hoan Tran <hotran@apm.com>
>>>> > ---
>>>> >  .../devicetree/bindings/hwmon/apm-xgene-hwmon.txt          | 14 ++++++++++++++
>>>> >  1 file changed, 14 insertions(+)
>>>> >  create mode 100644 Documentation/devicetree/bindings/hwmon/apm-xgene-hwmon.txt
>>>> >
>>>> > diff --git a/Documentation/devicetree/bindings/hwmon/apm-xgene-hwmon.txt b/Documentation/devicetree/bindings/hwmon/apm-xgene-hwmon.txt
>>>> > new file mode 100644
>>>> > index 0000000..49a482e
>>>> > --- /dev/null
>>>> > +++ b/Documentation/devicetree/bindings/hwmon/apm-xgene-hwmon.txt
>>>> > @@ -0,0 +1,14 @@
>>>> > +APM X-Gene hwmon driver
>>>> > +
>>>> > +Hwmon driver accesses sensors over the "SLIMpro" mailbox.
>>>>
>>>> DT bindings describe h/w, not driver data.
>>> How about this description: "APM X-Gene SOC sensors are accessed over
>>> the "SLIMpro" mailbox" ?
>>>> I'm not sure this belongs in
>>>> DT and perhaps the devices for the mailbox should be created by the
>>>> mailbox driver.
>>> I don't think the current mailbox supports it.
>>>>
>>>> > +
>>>> > +Required properties :
>>>> > + - compatible : should be "apm,xgene-slimpro-hwmon"
>>>> > + - mboxes : use the label reference for the mailbox as the first parameter.
>>>> > +         The second parameter is the channel number.
>>>>
>>>> When do you expect this to be different mailbox numbers?
>>> No, this number is not changed. This "mboxes" property is used and
>>> required by mailbox.c when hwmon driver requests a mailbox channel
>>>
>> I think that's inaccurate.
>>
>> The h/w and the firmware combined is the "platform" from Linux POV.
>> Channels are physical resources provided by a mailbox controller.
>> Currently the firmware listens on Channel-7 but some future revision
>> might switch to, say, Channel-9.  Or say the same firmware on next
>> revision of h/w may have to switch to Channel-3 because it has only 4
>> channels. So I see the mailbox channel number as a hardware property
>> just like an IRQ (which very often change with SoC iterations).
>
> Agree about that. I suppose this number is not changed. But as you
> said, the mailbox channel number can be changed based on SoC or
> Firmware. It would be better if this channel number is specified
> inside a DT node.
>
> Hi Rob, do you have any comments ?
>
> Thanks
> Hoan
>
>>
>> Cheers.

Hi Rob,

Do you have any comments on Jassi's reply ?
If not, I'll send another version which included the binding document
and DT node.

Thanks
Hoan
