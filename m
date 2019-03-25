Return-Path: <SRS0=S2uc=R4=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E007CC43381
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Mar 2019 13:17:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B5E1420854
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Mar 2019 13:17:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731235AbfCYNRU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Mar 2019 09:17:20 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:40414 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730694AbfCYNRU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Mar 2019 09:17:20 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x2PDEQla027345;
        Mon, 25 Mar 2019 08:16:54 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail3.cirrus.com ([87.246.76.56])
        by mx0b-001ae601.pphosted.com with ESMTP id 2rdh7jvmkr-1;
        Mon, 25 Mar 2019 08:16:53 -0500
Received: from EX17.ad.cirrus.com (ex17.ad.cirrus.com [172.20.9.81])
        by mail3.cirrus.com (Postfix) with ESMTP id E2E52611C8B2;
        Mon, 25 Mar 2019 08:17:15 -0500 (CDT)
Received: from imbe.wolfsonmicro.main (198.61.95.81) by EX17.ad.cirrus.com
 (172.20.9.81) with Microsoft SMTP Server id 14.3.408.0; Mon, 25 Mar 2019
 13:16:52 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])        by imbe.wolfsonmicro.main (8.14.4/8.14.4) with ESMTP id
 x2PDGpp1011668;        Mon, 25 Mar 2019 13:16:51 GMT
Date:   Mon, 25 Mar 2019 13:16:51 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     <jdelvare@suse.com>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <linux-hwmon@vger.kernel.org>, <corbet@lwn.net>,
        <devicetree@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH v2 2/2] hwmon: lochnagar: Add Lochnagar 2 hardware
 monitoring driver
Message-ID: <20190325131651.GF46536@ediswmail.ad.cirrus.com>
References: <20190325110020.4349-1-ckeepax@opensource.cirrus.com>
 <20190325110020.4349-2-ckeepax@opensource.cirrus.com>
 <7cd9502f-f986-d513-45a6-e7e40bd67b1f@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7cd9502f-f986-d513-45a6-e7e40bd67b1f@roeck-us.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1903250099
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Mar 25, 2019 at 04:17:31AM -0700, Guenter Roeck wrote:
> On 3/25/19 4:00 AM, Charles Keepax wrote:
> >From: Lucas Tanure <tanureal@opensource.cirrus.com>
> >
> >Lochnagar is an evaluation and development board for Cirrus
> >Logic Smart CODEC and Amp devices. It allows the connection of
> >most Cirrus Logic devices on mini-cards, as well as allowing
> >connection of various application processor systems to provide a
> >full evaluation platform.
> >
> >This driver adds support for the hardware monitoring features of
> >the Lochnagar 2 to the hwmon API. Monitoring is provided for
> >the board voltages, currents and temperature supported by the
> >board controller chip.
> >
> >Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> >Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> >---
> >+/**
> >+ * float_to_long - Convert ieee754 reading from hardware to an integer
> >+ *
> >+ * @data: Value read from the hardware
> >+ * @precision: Units to multiply up to eg. 1000 = milli, 1000000 = micro
> >+ *
> >+ * Return: Converted integer reading
> >+ *
> >+ * Depending on the measurement type the hardware returns an ieee754
> >+ * floating point value in either volts, amps or celsius. This function
> >+ * will convert that into an integer in a smaller unit such as micro-amps
> 
> The hwmon ABI says that voltages and current shall be reported in milli-units.
> There is no option or means to report micro-units to userspace. A value of
> 1000 as reported to userspace means 1 Volt or 1 Ampere. Nothing else.
> The above and the summary suggest that the intent here is to report units
> to userspace in micro-units. This is against the ABI and not permitted.
> 

This is the intent, mostly coming from advice from your email on
the 18th Feb 2017 (see below). At the time Lucas had been talking
about nano-amps but really the hardware is only accurate down to
about 10uA or so.

> You could on purpose violate the ABI and report the current in
> nano-Amps with currX_input
> (properly documented). This way the sensors command would still work after proper
> adjustments in /etc/sensors3.conf. If the current sense resistor is configurable,
> you could also not tell me at all and assume a current sense resistor which is
> 1,000,000 times larger than the one you actually use (after all, currency is
> usually measured as voltage loss over a current sense resistor).

> Another possibility would be to add a curr1_input_na attribute, but I would prefer
> the above mechanism.

Apologies couldn't find an archive for the hwmon list going
back far enough, so just had to copy that in, hopefully your
own records go back far enough. I am certainly open to other
options such as your other suggest of a newer higher precision
file being added.

> Besides, if it takes 96 samples to read the current, an accuracy in uA has zero
> value. Similar really applies to uV - it is hard to believe that any HW would be
> able to return values with such an accuracy.

This bit however I have to disagree with.

The purpose of this monitor hardware is generally accessing the
power consumption of embedded audio hardware. Our hardware will
frequently be operating in situations where it is drawing only
a couple or even sometimes less than a milli-amp. So reporting
on the scale of milli-amps is certainly not acceptable for
our use-cases.

As regards the averaging, the draw of the audio hardware can be
quite spikey and since we want to check the power consumption
averaging is greatly preferable. As I mentioned in my previous
email the average actually takes place in analog so it helps
us get power numbers that include the spikes. Without that one
could greatly over/under estimate depending on your luck with
the timing of the current measurements.

We could potentially switch to millivolts rather than microvolts,
as our use-cases don't generally need the precision on voltage,
if you prefer? But for current we will need to come up with some
solution to pass more accurate measurements.

> >+	/*
> >+	 * Actual measurement time is ~1.67mS per sample, approximate
> >+	 * this with a 1.5mS per sample msleep and then poll for
> >+	 * success upto ~0.17mS * 1023 (max nsamples). Normally for
> 
> up to
> 
> >+	 * smaller values of nsamples the poll will complete on the
> >+	 * first loop due to other latency in the system.
> >+	 */
> >+	msleep((nsamples * 2) - (nsamples / 2));
> 
> nsamples * 3 / 2 might be a bit easier to read.
> 
> >+	ret = regmap_write(regmap, LOCHNAGAR2_IMON_CTRL3, 0);
> >+	if (ret < 0)
> >+		return ret;
> >+
> >+	return 0;
> 
> Why not just return the result of regmap_write() ?
> 
> >+	ret = regmap_write(regmap, LOCHNAGAR2_IMON_CTRL4, 0);
> >+	if (ret < 0)
> >+		return ret;
> >+
> >+	return 0;
> 
> 	return regmap_write() ?
> 

No problem with any of these will get them fixed up for v3.

Thanks,
Charles
