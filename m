Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233821;
	b=bSdvz0rh5S/8NiirEAi2ppYBrO/y6/gToDE+uEOlMklR4JoURpF0eD7C/0hA90QJoWry
	 u9RNK+wTF6/i8VeIhRJoP+N1/axIGlFHp00T52ujm5kppG+sbMfaj0ZOdp8+mXIiizEqR
	 UlyU1Zyq3kx/KUnucn1xF+SJU7WWHKHWhJA8vzrnVu24u0JtHFxQwbNQqGIKF5RJq96wi
	 YkVeN0R4iWjVE+y169VWnvoAsf3Ldu9L/BtnQAqIhzJLFyQ4n4fIVvFjzQ9C+zgBCqLgW
	 8bSJqAkWQpZInrDiSC/wa37RqPygwevKWNP5jUfSW/VgqtPFDxyNCTqCtI90OaZmWEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233821;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=L2s3pjglTEpRyqkzRwUXrNJt6jLvT1srkeI6LUFje2k=;
	b=fKTseazy+BgR7MlT6zKdxWTRvP7NG/1Qh+qJ5lp+3ykUkvGqeM62J89c7ImLuB4+bZtu
	 g7JidTJyh+7cVFDAIpe4UsJ9JEFoovzj8ypFvNmpo+YHl/CMsc+oNqAq7DnpIjQYg7bMY
	 9RLl1LLBNOE3OeE5awiBRa8LEB6hXM4jr83rCZsvIHGoBhC7ruoRcfdMg/96nCZRvZTlr
	 Z+VBu0RiORDuj+Gr8QyroQnEP+I7P2btW7lSP56llU8jIgFN7GdLcB2ToMvg7Aw0QFTDX
	 VxHNiSf/RJ/FBJnv2B1oAYInQLVek+GSirAsJ2c8FUQ6utuGY6jjFI05rp+gfanXRsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=avEsCaJI;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5651E606A31C;
	Mon,  9 Nov 2026 14:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5651E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=avEsCaJI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794233820; x=1825769820;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=JP+2r8znMZBrw8sPCZSzwzaSBXT0e/+SgVUwpoRfCuU=;
  b=avEsCaJIQ9FRcGHWnk9oCNFBJmtuospYanDAsF0BJZj5JU5bz3pJLf2k
   LAhFmXYQb8OPVdJEGyw90uU1dNIWvAdMWwVDbottqG0HmhYd3R/Oi8VY3
   DmjxNdpLzS6zVtlR3PkUeU9l2FkBaFmQa2vcTM2r9tz57HTerW7DiLxQB
   aZ9URP3F/kK9FrNkO6b6OvYWLh46r2jxhqp9LiZWRTUoYP3qt7baLDsKv
   W8gGDs2l28kLsgKRSM4oUUX+qzhIyeZGZ/gLpsQNk6fRNbaOdZSrIhfVa
   qTiMOYJ65VO39uyv9ndmun1xxeQCOD1cG7Lp9ypqt//JbikcpfcB+lEen
   A==;
X-CSE-ConnectionGUID: YZP0lErJSSicAS5ryM4qXQ==
X-CSE-MsgGUID: i/1i3uvAQK+03dLI7aBfrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="3044796"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="3044796"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 06:16:59 -0800
X-CSE-ConnectionGUID: WQnxvVlmTDiutxUauWi3LQ==
X-CSE-MsgGUID: pyES9PqTR+mxdF6H2zkONg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8055392"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.139])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 06:16:54 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 9 Nov 2026 16:16:50 +0200 (EET)
To: Rahul Pon <theflyingrahul@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, 
    Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
    Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
    Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
    platform-driver-x86@vger.kernel.org, devicetree@vger.kernel.org, 
    linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] platform: arm64: Add HP OmniBook 5 16 embedded
 controller driver
In-Reply-To: <08a43e54-6f54-489d-9ba7-6cfc6eb173c4@oss.qualcomm.com>
Message-ID: <ada64bce-bf80-37a1-a483-048c0d64131f@linux.intel.com>
References: <20261109104914.1534-1-theflyingrahul@gmail.com> <20261109104914.1534-3-theflyingrahul@gmail.com> <08a43e54-6f54-489d-9ba7-6cfc6eb173c4@oss.qualcomm.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 Nov 2026, Konrad Dybcio wrote:

> On 11/9/26 11:49 AM, Rahul Pon wrote:
> > The embedded controller of the HP OmniBook 5 16 (Snapdragon X2) sits on
> > I2C at address 0x76 and takes commands through a mailbox: wait for an
> > idle status (0xef), write the command and sub-command (0xed), wait for
> > completion, then read the 32-byte reply (0xee). Its interrupt line
> > signals events, read from register 0x00 and acknowledged by writing 0
> > back, as HP's ACPI does.
> 
> [...]
> 
> > +What:		/sys/bus/i2c/devices/<bus>-0076/kbd_backlight_level
> > +Date:		September 2026
> > +KernelVersion:	7.4
> > +Contact:	Rahul Pon <theflyingrahul@gmail.com>
> > +Description:
> > +		(RO) The keyboard backlight level of the HP OmniBook 5 16:
> > +		0 (off), 1 or 2. Only the backlight key changes it, inside the
> > +		embedded controller. The attribute is notified when the EC
> > +		reports a change.
> 
> That's already reported in <led_subdevice_path>/brightness
> 
> [...]
> 
> 
> > +static enum led_brightness hpec_led_get(struct led_classdev *cdev)
> > +{
> > +	struct hpec_led *led = container_of(cdev, struct hpec_led, cdev);
> > +	u8 reply[HPEC_REPLY_LEN];
> > +
> > +	if (hpec_command(led->ec, HPEC_LED, HPEC_LED_GET, reply))
> > +		return LED_OFF;
> > +
> > +	return (reply[1] >> (led->index - hpec_leds[0].index)) & 1;
> 
> "& 1" -> "& BIT(0)"

If that could be named with a define, even better.

-- 
 i.

