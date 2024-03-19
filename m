Received: from rs227.mailgun.us (rs227.mailgun.us [209.61.151.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849543BBE6
	for <linux-hwmon@vger.kernel.org>; Tue, 19 Mar 2024 05:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.61.151.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710827251; cv=none; b=ekFZdEQA8r7LiuYEU7w75ObjVgdPMIzWEyNmO7RuwzqHy36sAKezxPJBxDCirRCKM/lT8Gd8f/H/cHjOPsdsoyXsMCOmPIlV901s3Z7ay6KF0ltRtdM1aRymSHo9/UHg2UiFlcGUuP+A4ZlJ5Z4Ezx30fS9tsdIgCrzJb19XmDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710827251; c=relaxed/simple;
	bh=2P2DwSKvdxYAbERqA7CxZKDFTzVKzDQJD7TsOPUnsmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJIobrwL2XWkY2nHYpASm2RPIqphwDeMZemW4KwMnX452XaatULv49j7h9+aD7nhIEGDU7tR5c+5fPrWmJIqU381hWQZ0tv9g34b4jw4xcpS/yMp4sJMiLaQSalpNym1V7c4RPBWXukW3V+2OPvaG6215bxTs7lxczhVN5ibPHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=equiv.tech; spf=pass smtp.mailfrom=equiv.tech; dkim=pass (2048-bit key) header.d=equiv.tech header.i=@equiv.tech header.b=XCkAXYYy; arc=none smtp.client-ip=209.61.151.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=equiv.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=equiv.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=equiv.tech header.i=@equiv.tech header.b="XCkAXYYy"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=equiv.tech; q=dns/txt; s=mx; t=1710827248; x=1710834448;
 h=In-Reply-To: Content-Type: MIME-Version: References: Message-ID: Subject: Subject: Cc: To: To: From: From: Date: Sender: Sender;
 bh=awhPCn410aSXJmB/s6Wmb5B5AXJxHHyGsZcyy9sjzsU=;
 b=XCkAXYYyd9NGwv8zB1Rk2BrFuFti8m4HxnxLJWUqCnQ3yTsMi+mbLhT289KGa07NfwUM4dP6+HrufJPqlEMQW5rNXtGljyWSONDkkrF9h85g7zotFTeYWJ6iBWjh7lMfVIctof71avr0bX8VIkaRtFOIUfKwYtsuO913SH94j5e5FAAtUsLfcXrDkpHaxLak26zja0Bpuamh+OyHdW39+WeCCQxjKp4RdjHVC5H/yNpnjEq5oqwSJ8pb20A0MDgLfGdu4Dq+LgJL0pJr1xKqzAQQnLBjTRtO3NoqinSrV6CqzP3LlABzfFaQCWCXQytRW3iI2+SHUWhh2YmpPE2CTA==
X-Mailgun-Sending-Ip: 209.61.151.227
X-Mailgun-Sid: WyJkOWUwNSIsImxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZyIsIjkzZDVhYiJd
Received: from mail.equiv.tech (equiv.tech [142.93.28.83]) by 569a831ee738 with SMTP id
 65f926f0c58633fd7aa38bdd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 19 Mar 2024 05:47:28 GMT
Sender: james@equiv.tech
Date: Mon, 18 Mar 2024 22:47:27 -0700
From: James Seo <james@equiv.tech>
To: Armin Wolf <W_Armin@gmx.de>
Cc: jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC 0/1] hwmon: (hp-wmi-sensors) Support autoloading
Message-ID: <Zfkm71dmnRsdmYJz@equiv.tech>
References: <20240318215732.322798-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240318215732.322798-1-W_Armin@gmx.de>

On Mon, Mar 18, 2024 at 10:57:31PM +0100, Armin Wolf wrote:
> Currently, the hp-wmi-sensors driver needs to be loaded manually
> on supported machines. This however is unnecessary since the WMI
> id table can be used to support autoloading.
> 
> However the driver might conflict with the hp-wmi driver since both
> seem to use the same WMI GUID for registering notify handler.
> 
> I am thus submitting this patch as an RFC for now.
> 
> Armin Wolf (1):
>   hwmon: (hp-wmi-sensors) Add missing MODULE_DEVICE_TABLE()
> 
>  drivers/hwmon/hp-wmi-sensors.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> --
> 2.39.2
>

Autoloading was deliberately left out for now because of the GUID
conflict with hp-wmi's WMI notify handler.

HP's GUID reuse across product lines for different types of WMI
objects with different names and shapes means that with a patch like
this, many systems that should only load hp-wmi-sensors but not
hp-wmi will try to autoload both. (Perhaps all of them; I want to say
that the GUID 5FB7F034-2C63-45e9-BE91-3D44E2C707E4, which is the
second of the two GUIDs that hp-wmi uses to autoload, exists on every
HP system I've examined.)

Meanwhile, hp-wmi does various other platform things, and there's so
much hardware out there that who knows, maybe there are some systems
that really should load both. I don't think so but I can't rule it
out.

Unlike hp-wmi-sensors, hp-wmi doesn't survive failure to install its
notify handler, which sets up a potential race condition depending on
when hp-wmi and hp-wmi-sensors loads on a given system.

Therefore, I intended to add autoloading at the same time as
converting hp-wmi-sensors to use the bus-based WMI interface once
aggregate WMI devices are better supported.

As you mentioned [1], I ran into issues when I tried to do the
conversion by simply adding the GUID to struct wmi_driver.id_table.
That resulted in two separate independent instances of hp_wmi_sensors
being loaded, which isn't what I wanted.

[1] https://lore.kernel.org/linux-hwmon/cd81a7d6-4b81-f074-1f28-6d1b5300b937@gmx.de/

