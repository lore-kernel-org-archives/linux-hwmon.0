Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EF229D288;
	Thu, 23 Jul 2026 15:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784819736; cv=none; b=p+XAdNxWvf780sjufGgfsF3Iufci2tShsARXgVeFWvQKMSMUZoyXlaJzp0XDsTexRcI/iF+Kj5BZeqfSqmT4gaO2f4XTzIpbExius2rGVMkwRg54yK3dw2nmJaZks36/GRtAaAphdhSbCji6W8cXR1p0yiACTy0dSBOq7fwcZjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784819736; c=relaxed/simple;
	bh=jGI2x8GnwalAZiHs1AwOjvraU3Pw43yMd9CQeoqQ7ME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BkKKymeCCRCVYvRRsVYS4q8Dg5rEOHBxZSVurw4F5lp87A8JDji8k2usjoAkl6x/4sOLcTglEEDOX+u0WqOAOMvy/7P6wq6KeNzhrRAC0ZY2k4pEvfmQtHvrpNBF84q2aqRYH3aVHkaHfXUnYEkAtEBJUemXOxz7YZ7UqYz7HLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=i2NjN1Bg; arc=none smtp.client-ip=212.27.42.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="i2NjN1Bg"
Received: from L30177.local (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id CB613780503;
	Thu, 23 Jul 2026 17:15:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1784819733;
	bh=jGI2x8GnwalAZiHs1AwOjvraU3Pw43yMd9CQeoqQ7ME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i2NjN1Bgv+fNJd9jJxvYvjMGHZGWqd4RatGo0CXXeTCH/LhAfdpMsiHxEn42K/o4a
	 isZeSbbTBmU0WzYDu5ljNyiaCYSYSgyjTp8kQuGhXBgcmcL4vcd3c1rcQ97iKaQZWJ
	 wfCA7mo0Eosyo/eWAN6EI3yoMO4OeDKRmUCB3g4AYMm6MT1ulgxz7RvEF49alSyhmn
	 Tvz3PRmAiy1+k75yHYuFodCVDBNzIcfvZque1ryFmfHoSOG7YGGAHuOh2AR3U+yNoh
	 /lUDN+vnCDbSE2RSfLH5Jq73u/+ph70/FhIEEqAOhPCMuZ5gg3jfWuWV8yqJzyKtDa
	 dbXfKLzSSDvdg==
Date: Thu, 23 Jul 2026 17:15:27 +0200
From: Vincent Jardin <vjardin@free.fr>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 1/3] hwmon: pmbus: event notification with alarms
Message-ID: <amIwD-TVdoMGY7YV@L30177.local>
References: <20260723-mpq8646_v0-v1-0-14363c75916f@free.fr>
 <20260723-mpq8646_v0-v1-1-14363c75916f@free.fr>
 <20260723131352.182B61F000E9@smtp.kernel.org>
 <amIlIYP3fcLh0h_E@L30177.local>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <amIlIYP3fcLh0h_E@L30177.local>

Hi again,

Le 23/07/26 16:28, Vincent Jardin a écrit :
> Hi Mr. Bot,
> 
> > This is a pre-existing issue, but while looking at how hwmon devices are
> > exposed for alarm notification, I noticed that pmbus_notify() might be
> > sending notifications to the wrong kobject:
> > 
> > drivers/hwmon/pmbus/pmbus_core.c:pmbus_notify() {
> >     ...
> >     sysfs_notify(&data->dev->kobj, NULL, da->attr.name);
> >     kobject_uevent(&data->dev->kobj, KOBJ_CHANGE);
> >     ...
> > }
> > 
> > Since the hwmon attributes are attached to the hwmon device rather than the
> > parent I2C device, does sysfs_notify() fail to find the attribute and return
> > silently?
>  ...
> > Would it make sense to update pmbus_notify() to use data->hwmon_dev->kobj
> > instead to ensure poll() and udev events work correctly?
> 
> OK, I'll fix in v2's 1/4, wait for the next,
> "hwmon: (pmbus/core) notify on the hwmon device, not the i2c client",
> both sysfs_notify() and kobject_uevent() will target data->hwmon_dev->kobj.

in fact, I'll send a specific fix for it to avoid confusions.

> > -- 
> > Sashiko AI review · https://sashiko.dev/#/patchset/20260723-mpq8646_v0-v1-0-14363c75916f@free.fr?part=1
> 
