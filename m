Return-Path: <SRS0=S2uc=R4=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B638C43381
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Mar 2019 16:46:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0E1AF20863
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Mar 2019 16:46:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vf+lAaBo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729877AbfCYQqZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Mar 2019 12:46:25 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33945 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729714AbfCYQqZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Mar 2019 12:46:25 -0400
Received: by mail-pl1-f195.google.com with SMTP id y6so214440plt.1;
        Mon, 25 Mar 2019 09:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/YCzK77ixt9x9oJEu/Ii+q7r/GVjp3exhwdHtVMqQWY=;
        b=vf+lAaBof173Oq14J4yZEwo9Iivg6x1x1rbxoa9XWdC2rWvD0eGZNxDlzJCYJfb3LR
         95/cKdzKdU6Mz1FUbDIfKrrtVCxF/Bd/BAmQDy20ZNqHTKf4L/zpjnK+cL6acY0Rp6VK
         Bv/qz5jiOy0oaD9HsSZlvo6HIiddMnte+B4gLyM7CF1HuMuchvNTMTxKyNyY5sGMS0U0
         vx7sseFAyywmCWQINmxF2M7VKQHyC1Me6Uaecj9L6pOFsA3hHWLDr9eKsLyqboQss/Rq
         0AQBgErPCzawvJqgz39reQGGj2kisfxdO2v5b7ItMtsTdGdLMIIEy7L8nHcoE+0eG5tA
         qg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=/YCzK77ixt9x9oJEu/Ii+q7r/GVjp3exhwdHtVMqQWY=;
        b=lFENXG1tMvsimxwDD2maX+LJJL7JwFug4PdeD315IYrD/tdcurQxZCaLhuQwQZq0HE
         hBQ040XLUGlzhmhzQGio4s6EeZylhrcShUkmgknnlzo1RK5WoU5z42fIIIYmf8mTPkA0
         TLTnaj34zsa7lkVVStC8lA897Ea+uj7PhGu9EZ0Ics+UNGdjPzozS8Ti7TQczUT2KNjw
         fguF+J31vWr/5uFDBqXckTzNuSp3s+0YuaeZLGQZkYcDilwlp2SqUG7BOl5bDtYlSs9H
         +KbZeg1vSVL2u+MMha1uxZwIKdQamHsAqIjNTOZtveofyceFF1nB2qHAvHafv0gM/Ouo
         RZ3g==
X-Gm-Message-State: APjAAAV+bwRE9paIx0qO4PaXFI5ukJyKB6qx56jKCmHM4klQHECJBui2
        ACdGfzYM9qaYSmd4JVYiBqY=
X-Google-Smtp-Source: APXvYqzMMbaP5nmwIkKGgLadgVcFQ435D4G/PeV+eAA0+t3BOoI0BRce+ih6HYM2OgB1WIUstN69Og==
X-Received: by 2002:a17:902:6b48:: with SMTP id g8mr25908876plt.21.1553532384848;
        Mon, 25 Mar 2019 09:46:24 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c16sm116728pfb.102.2019.03.25.09.46.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Mar 2019 09:46:24 -0700 (PDT)
Date:   Mon, 25 Mar 2019 09:46:22 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-hwmon@vger.kernel.org, corbet@lwn.net,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v2 2/2] hwmon: lochnagar: Add Lochnagar 2 hardware
 monitoring driver
Message-ID: <20190325164622.GB28275@roeck-us.net>
References: <20190325110020.4349-1-ckeepax@opensource.cirrus.com>
 <20190325110020.4349-2-ckeepax@opensource.cirrus.com>
 <7cd9502f-f986-d513-45a6-e7e40bd67b1f@roeck-us.net>
 <20190325131651.GF46536@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190325131651.GF46536@ediswmail.ad.cirrus.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Mar 25, 2019 at 01:16:51PM +0000, Charles Keepax wrote:
> On Mon, Mar 25, 2019 at 04:17:31AM -0700, Guenter Roeck wrote:
> > On 3/25/19 4:00 AM, Charles Keepax wrote:
> > >From: Lucas Tanure <tanureal@opensource.cirrus.com>
> > >
> > >Lochnagar is an evaluation and development board for Cirrus
> > >Logic Smart CODEC and Amp devices. It allows the connection of
> > >most Cirrus Logic devices on mini-cards, as well as allowing
> > >connection of various application processor systems to provide a
> > >full evaluation platform.
> > >
> > >This driver adds support for the hardware monitoring features of
> > >the Lochnagar 2 to the hwmon API. Monitoring is provided for
> > >the board voltages, currents and temperature supported by the
> > >board controller chip.
> > >
> > >Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> > >Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > >---
> > >+/**
> > >+ * float_to_long - Convert ieee754 reading from hardware to an integer
> > >+ *
> > >+ * @data: Value read from the hardware
> > >+ * @precision: Units to multiply up to eg. 1000 = milli, 1000000 = micro
> > >+ *
> > >+ * Return: Converted integer reading
> > >+ *
> > >+ * Depending on the measurement type the hardware returns an ieee754
> > >+ * floating point value in either volts, amps or celsius. This function
> > >+ * will convert that into an integer in a smaller unit such as micro-amps
> > 
> > The hwmon ABI says that voltages and current shall be reported in milli-units.
> > There is no option or means to report micro-units to userspace. A value of
> > 1000 as reported to userspace means 1 Volt or 1 Ampere. Nothing else.
> > The above and the summary suggest that the intent here is to report units
> > to userspace in micro-units. This is against the ABI and not permitted.
> > 
> 
> This is the intent, mostly coming from advice from your email on
> the 18th Feb 2017 (see below). At the time Lucas had been talking
> about nano-amps but really the hardware is only accurate down to
> about 10uA or so.
> 
> > You could on purpose violate the ABI and report the current in
> > nano-Amps with currX_input
> > (properly documented). This way the sensors command would still work after proper
> > adjustments in /etc/sensors3.conf. If the current sense resistor is configurable,
> > you could also not tell me at all and assume a current sense resistor which is
> > 1,000,000 times larger than the one you actually use (after all, currency is
> > usually measured as voltage loss over a current sense resistor).
> 
> > Another possibility would be to add a curr1_input_na attribute, but I would prefer
> > the above mechanism.
> 
> Apologies couldn't find an archive for the hwmon list going
> back far enough, so just had to copy that in, hopefully your
> own records go back far enough. I am certainly open to other
> options such as your other suggest of a newer higher precision
> file being added.
> 
Try lore.kernel.org/linux-hwmon.

> > Besides, if it takes 96 samples to read the current, an accuracy in uA has zero
> > value. Similar really applies to uV - it is hard to believe that any HW would be
> > able to return values with such an accuracy.
> 
> This bit however I have to disagree with.
> 
> The purpose of this monitor hardware is generally accessing the
> power consumption of embedded audio hardware. Our hardware will
> frequently be operating in situations where it is drawing only
> a couple or even sometimes less than a milli-amp. So reporting
> on the scale of milli-amps is certainly not acceptable for
> our use-cases.
> 
> As regards the averaging, the draw of the audio hardware can be
> quite spikey and since we want to check the power consumption
> averaging is greatly preferable. As I mentioned in my previous
> email the average actually takes place in analog so it helps
> us get power numbers that include the spikes. Without that one
> could greatly over/under estimate depending on your luck with
> the timing of the current measurements.
> 
That makes some sense. Maybe add a note to the code describing the
reason for taking several measurements ?

> We could potentially switch to millivolts rather than microvolts,
> as our use-cases don't generally need the precision on voltage,
> if you prefer? But for current we will need to come up with some
> solution to pass more accurate measurements.
> 
I do have some second thoughts about my 2017 comments. From an ABI
perspective, it is highly undesirable to provide false data on purpose.

Do you need micro-units for all measurements ? If not, or even if so,
a simple solution might be to provide currX_input_ua and possibly
inX_input_uv for those attributes where needed, in addition to the
default attributes, which would be reported in mV / mA. That would meet
both the ABI and your requirements.

There is another possibility which might meet your requirements: If the
important attribute is power consumption, you might consider providing
power attributes. Those _are provided in micro-units. That isn't exactly
as expected, as drivers should only provide power attributes if actually
reported by the HW, but there is an argument to make that it makes sense
here. You could then even provide powerX_average and make the number
of samples indirectly configurable with powerX_average_interval.

Thanks,
Guenter

> > >+	/*
> > >+	 * Actual measurement time is ~1.67mS per sample, approximate
> > >+	 * this with a 1.5mS per sample msleep and then poll for
> > >+	 * success upto ~0.17mS * 1023 (max nsamples). Normally for
> > 
> > up to
> > 
> > >+	 * smaller values of nsamples the poll will complete on the
> > >+	 * first loop due to other latency in the system.
> > >+	 */
> > >+	msleep((nsamples * 2) - (nsamples / 2));
> > 
> > nsamples * 3 / 2 might be a bit easier to read.
> > 
> > >+	ret = regmap_write(regmap, LOCHNAGAR2_IMON_CTRL3, 0);
> > >+	if (ret < 0)
> > >+		return ret;
> > >+
> > >+	return 0;
> > 
> > Why not just return the result of regmap_write() ?
> > 
> > >+	ret = regmap_write(regmap, LOCHNAGAR2_IMON_CTRL4, 0);
> > >+	if (ret < 0)
> > >+		return ret;
> > >+
> > >+	return 0;
> > 
> > 	return regmap_write() ?
> > 
> 
> No problem with any of these will get them fixed up for v3.
> 
> Thanks,
> Charles
