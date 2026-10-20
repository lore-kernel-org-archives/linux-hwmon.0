Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481475;
	b=YL8+NcngEV+QdGl/uLljhyEcoQICcTKJt7qn6Jn6qs2xpzQbvWMtAFgo0LbKvOVIGYUd
	 MjoafEe2NGBInj7Rw6WMSscDTqWCpXeMZnxvvNQCSnwtqRh0ZgfzENJa4ZrEhSwU9+OWk
	 KJOCJ+LKiQrLMH4tChIbc98ald9Zjz744+dgLmGxP6SuoGfOYuoSK2TcaaZn0P13d8zbg
	 VZlNS67xh/IchQF0I7bMmRb//QyucJRs/dgOySjgSEF4TftxfnUVyxxofyS9EUiO5GJMf
	 K/K+85ZQbu2SB9hWsjMEDmWi/kHddBZWZf0Ha081sjzwV+S69AIX7vSt2q16CokKBpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=815SsM77bI103RTpPZ3otFe7kjVWH55eLpLwzR1qzZo=;
	b=G6AsLFz+wJq3g4toys1grvGM4nRU5mAi5bxF/CVDPrIuf89v36dtpapA7BcHzVGpRZ8y
	 0+UYF6OUt7NUpQ4T5dda2RHMtHos8niLKpsCbl6POUFx3r7DrzgSMXx73Pldn/3ZXVw57
	 h+lx0J1WHN0Woou4zQUbsdcGsjehJ6QN65i/9PqHeQiKzGkd4RSZ5y4zgI/qsHulUD2Mj
	 CErCLiX5/fCHHBX4x9VJGW1XC8ghObO999d/bmYYxjdi+El9gxSLyKQrfnPlg3nhSY3MT
	 zTkxAYeS2FlmBWuB5odbvR9ijGHbTS4cfpNEARB5jV0Jyx1zMi2QmbPKu/q5pzKSkeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=fKzmQ+wr;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209CD606A31D
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 07:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 209CD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=fKzmQ+wr
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-17bc533fda3so3416894c88.1
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 00:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792481474; x=1793086274; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=815SsM77bI103RTpPZ3otFe7kjVWH55eLpLwzR1qzZo=;
        b=fKzmQ+wr0iHs17XveY4mXkajGBGI1YSvWf6kd9PPtzThe5D+aBCdFVWtMShsP3Gqra
         jKTDqQ9VeI2iwsS6AmcU0C4F7+Dn1v8uywxGAxmq5Ee/3jxeUJsbwUzp1JCIiTNKc7f1
         hIJXVhEY9efZoYUbxGTkrhE2M4jAx2oaXzOeFedPfGWqoiFoIrXr32nrCTrx8bNYXhV8
         3ykJHwUuksj4bIX0grzS6rgExvKmZJYMl/eltoSEyJlDdbPBHrF6mjEPAA0tZES3dFEM
         bRR+/7RzCIpY9Op9GPtst4qj9xvh8LAJbwsEShgGjEpeEwXr7B2vaxyFuSl9Q+rUgmhb
         UXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481474; x=1793086274;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=815SsM77bI103RTpPZ3otFe7kjVWH55eLpLwzR1qzZo=;
        b=0ngtE5C67SWvjPwVDqGUKubQgaV8AIvsFA8WGxWAQV5E5lBmcZ6vWJCPHTOzjx8qaw
         vYNQ0ihgppnNcy7ybgEWqyMw1gF//LgBNbQo0nnLKgQbFGZrCHeeMhISL7eepm4e/USP
         VJxzE1abVfMZf73kH+QI3GPb3OVDYw8CGwDONK00BR3GJWkabzLyl6suzbtaF8Hqmk58
         f9h/J9Zszud1xkZ449JQFDxmxMcJci/Y4SGkM3GiP2ZRzcRl+pMw7ITsivcITXkSZc4c
         EabFKAmdwN34kdHbRBfG1Vo1b+RJgtmoTyV70rERpbjionL0u9Dw0GjA6ORiXDZWGx1F
         Nu0w==
X-Forwarded-Encrypted: i=1; AKwUvBw33OCu2c35kLQTj8PpwxYAX5n/ZKE0xuJRqsWxJI/l9Z67W1I0uXkwOk0p8jKz7mG2Cy9Tn7oQVE0p8w==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1+OMjzifaXFy/9ts89b9ZfuECgT4vg8+JJUdr1RvvSG+0FdnE
	ffY2vHvJC2ng01LczsS/garZT1pDsJRdVNSTO8fAqZM68CWf36cr556Pi/dmDLXhcY4=
X-Gm-Gg: AYBFou1Xq3cipDHA/7jgavz7DnY769pnJddsAxcbhCRD+K84wUxyStQnJurK1sSIAE9
	XaGaiKD/dItkxLpo4o0pi1GN3N/cEo1p9AOh8kBI03WrJL/dVcD0PDwHdKYOcEowQA24ThC6Hna
	Jhq4nqYLzBmTN+UHELhMxqb03ijhQ3W2bvzQoJhqgd9FKjwd0mt4fVI51wDF8TV4dSFJiX0LpDu
	+i2iYIizml+/Ya33xVr55Qt/3k5CZCzUuUm71icGxXcx+mRJH6pdkMxXANVUF1bdnpapikXK0/5
	5m7D30aHGNsPj8u4QcS2GznKajy+cfTSN94N+n++j4d3/nV3ctvjSNz7+2lP+TQJIazfBkJeiOB
	ojHoIRAw64yIxTWnuV6YbD1OKZb64Ddxcsd8/Jq9V0xET//k4CO2/fESFMRNfDwJekjgibtofDq
	gIRkw9mp/Pp5oQ8PCHQaGl+mo6Ac0TgthoWHoDjUnxZFI0eVRbpl0SaNMGTq4ZnLja4CwMiwk=
X-Received: by 2002:a05:7022:e804:b0:13b:3132:6e99 with SMTP id a92af1059eb24-18512c38164mr15634892c88.20.1792481473844;
        Tue, 20 Oct 2026 00:31:13 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831996071csm35059153c88.9.2026.10.20.00.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:31:13 -0700 (PDT)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 00:31:11 -0700
Message-Id: <DM9HNFZ26I2H.348U7TRUKBLST@nexthop.ai>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jonathan
 Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, "Guenter Roeck" <groeck7@gmail.com>
Subject: Re: [PATCH 3/3] hwmon: (pmbus/fs1412) Add TDK FS1412 driver
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Guenter Roeck" <linux@roeck-us.net>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.22.0
References: <20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai>
 <20261008-hwmon-pmbus-fs1412-v1-3-0ae7e5ee4e41@nexthop.ai>
 <a3ccc85b-aab6-44b4-9695-ecd78401102c@roeck-us.net>
In-Reply-To: <a3ccc85b-aab6-44b4-9695-ecd78401102c@roeck-us.net>

On Mon Oct 19, 2026 at 1:25 PM PDT, Guenter Roeck wrote:
> This implementation is wrong. Support for relative mode should instead
> be added to the PMBus core. Or, rather, this driver should be tested with
> https://patchwork.kernel.org/project/linux-hwmon/patch/20240315151855.377=
627-2-lars.petter.mostad@appear.net/
> in place (with appropriate fixes for that patch if necessary), and the
> patches should be applied together.

Thanks! That is exactly what I was looking for, but my search for
fs1412 on lore didn't turn it up anything.

v2 will carry Lars' patch (Cc'd), rebased, with the driver reduced to
the MFR_ID check and hiding OT_WARN_LIMIT. v2 also adds the FS1525, a
25A part from the same family that is relative-only as well, so the
core change has two users. Fixes on top of Lars' version:

 - check VOUT_MODE for 0xff before testing the relative bit; as posted,
   a chip that does not support VOUT_MODE (reads 0xff) is marked
   relative and gets a bogus exponent
 - signed division, and clamp the user value before scaling it
 - fail probe if VOUT_COMMAND reads 0 rather than divide by it later
 - only update the cached VOUT_COMMAND after the write succeeded

We have a board with four FS1412 and one FS1525, so I could test both
parts with these patches on 7.2.10. Since your concerns in the 2024
thread were about how these parts actually behave, here is what they
do:

VOUT_MODE is read-only and relative-only. Both datasheets mark it
read-only. FS1412 returns 0x98 (exponent -8), FS1525 returns 0x96
(exponent -10). Writing 0x18 to VOUT_MODE on all four FS1412 is NACKed,
STATUS_CML reports invalid data (0x40), and VOUT_MODE stays 0x98.

Which commands are relative. The FS1525 command table marks
VOUT_MARGIN_HIGH/LOW, VOUT_OV_FAULT_LIMIT, VOUT_OV_WARN_LIMIT,
VOUT_UV_WARN_LIMIT, VOUT_UV_FAULT_LIMIT and POWER_GOOD_ON as "L16, 1.3
relative format". VOUT_COMMAND, VOUT_MAX and READ_VOUT are absolute.
That matches the list in Lars' patch; POWER_GOOD_ON is relative too,
but the core does not use it. The FS1412 datasheet says the same for
the limits it describes. Raw defaults, as a fraction of VOUT_COMMAND:

                     FS1412 (0x98)   FS1525 (0x96)
  VOUT_COMMAND       0x009a  0.602V  0x0266  0.600V
  VOUT_OV_FAULT      0x0133  1.199   0x04cc  1.199
  VOUT_OV_WARN       0x0126  1.148   0x1000  4.000
  VOUT_UV_WARN       0x00d9  0.848   0x0366  0.850
  VOUT_UV_FAULT      0x00cc  0.797   0x0333  0.800
  POWER_GOOD_ON      0x00e6  0.898   0x0365  0.849
  VOUT_MARGIN_HIGH   0x0119  1.098   0x0466  1.100
  VOUT_MARGIN_LOW    0x00e6  0.898   0x0399  0.899

With the patches the FS1412 reports in2_crit/max/min/lcrit as
721/690/509/478 mV against an in2_input of ~560-580 mV. Writing
in2_max and in2_min stores 0x012e / 0x00d0 and reads back within one
1/256 step. On the FS1525, writing 600 to in2_min stores 0x0402 and
writing 509 restores the original 0x0366. I did not exercise the
regulator path; the driver does not register a regulator.

Paging. Neither part implements PAGE. A PAGE read is NACKed and sets
STATUS_CML INVALID_CMD (0x80), so on these parts relative mode can only
be per chip. The patch tracks it per page, which also covers a
multi-page chip that sets the bit on every page.

Vendors getting it wrong. You were right to worry. Some things I ran
into:

 - The OV fault limit is rounded internally to one of four settings
   (105-120% in 5% steps on the FS1525), so only some values written
   to it take effect.
 - The parts are only partly consistent with their own command tables:
   OT_WARN_LIMIT and READ_IOUT are not listed for the FS1412, but both
   answer without a CML error, and OT_WARNING sets at room temperature.
 - The factory programming varies between parts on the same board: one
   FS1412 has VOUT_MAX 0xa500 and VOUT_MARGIN_HIGH 0xa400, the others
   0x0300 and 0x0119; another has VOUT_MARGIN_LOW 0x0000. The core does
   not touch these for hwmon.
 - The VOUT domain differs between the two parts. FS1412 reports
   READ_VOUT at the feedback pin, so it is in the same domain as
   VOUT_COMMAND and the converted limits. TDK told us that the FS1525
   reports READ_VOUT as the actual output regardless of an external
   divider. On our board that is 1.094V against a VOUT_COMMAND of 0.600V
   (a divider for a 1.1V rail).

   I checked what the FS1525 compares READ_VOUT against. Setting
   VOUT_OV_WARN_LIMIT to 1.5 sets VOUT_OV_WARNING; setting
   VOUT_UV_WARN_LIMIT to 1.5 does not. So the part compares the
   output-domain READ_VOUT against limit * VOUT_COMMAND (0.9V), which
   is exactly the value the core reports. That is presumably why this
   board's OV warn limit defaults to 400%.

One question before v2. The FS1525 over-voltage fault is the exception:
the datasheet says it is an analog comparison at the FB pin, at the
VOUT_OV_FAULT_LIMIT fraction of VOUT_COMMAND. So on a board with an
external divider in2_crit is in feedback-pin volts while in2_input is
the rail. On our board's FS1525 that is in2_crit 718 mV against
in2_input 1093 mV, with no alarm, and the actual trip point is about
1.31V on the rail. The chip has no way to report the divider. Which
would you prefer?

 a) Hide VOUT_OV_FAULT_LIMIT on the FS1525, so there is no in2_crit.
    Nothing misleading, but boards without a divider lose a correct
    in2_crit too.
 b) Scale in2_crit by READ_VOUT / VOUT_COMMAND measured at probe.
    Right while the rail regulates, wrong if it is off, ramping or
    margined at probe time.
 c) Describe the divider in DT and scale in2_crit by it. The FS1525
    would then need its own binding instead of a trivial-devices entry.

I lean towards a).

For other parts with relative mode I only know of the NCP3286 you
mentioned.

Thanks,
Abdurrahman

