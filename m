Received: from smtpfb2-g21.free.fr (smtpfb2-g21.free.fr [212.27.42.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB773290C9;
	Thu, 23 Jul 2026 14:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784816950; cv=none; b=p7YQT+RSCp8bD7NCFFvtImCziSk6NMALqPTNij1N7RCzIvJ7Pma4N4mElSUmCjvUpjBRrNVa4PHsOOjyE49fRBwD7SsSc3yjFtKdi8MZnuEOh3S24QkYdmcXqPPmjlN5mq8DbU9T02fk5gJbzXsNunEkhEnu8zBy/VC9meE3qK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784816950; c=relaxed/simple;
	bh=iGVMYBkOnfXFadt7eZykzXvZOHOYbYNmrt7WoODA9QM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hgBgkEkoVAZa0U12Ld/7JGzXCwwx11MOCPqhVUNVUKgJr6+bo1N8pNy5eqkJFmjtvyuPQHwAscXnJ+g+gVtT2WFQsgiXD5W42dvJpg1CeYrVULYBb7dhLqjro4f11pE/MOYuGsfNaD4TqRmpyhYqBwWHlt8ZJuubPXEuF9uH2ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=Akjs2QHn; arc=none smtp.client-ip=212.27.42.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="Akjs2QHn"
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id DF2704DF5B;
	Thu, 23 Jul 2026 16:29:02 +0200 (CEST)
Received: from L30177.local (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 496F2780372;
	Thu, 23 Jul 2026 16:28:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1784816935;
	bh=iGVMYBkOnfXFadt7eZykzXvZOHOYbYNmrt7WoODA9QM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Akjs2QHnhoHjmIiEczTH5X8Q1GBH7quMvO9Cl8op+JITvRGrHJEfo+Ej6UHFVuXJg
	 fOsiuHJcEU7xF9s6enE6wB1Ad8Wjv3z46Q+sqk6nwsqMOnjDuw3ebKEhbj4WyVLl46
	 q6Xe79VtL5l/YH9HzblImLiq7zQ8gNuJhWYw1E46FlfthYJ4KtJpqKjbCjxfw0VjWa
	 Vmtkrwi4pecQqv01l16Hr664n59rl7SM1kmo2iMd6TxHo9rb10sK3qmNjrrHUEj0vE
	 ZPpVO8+WkZhCbbiOo05jj33XlWbqkdMwA++Ul5t3nFCbn7Fn1gF0BGVG9eszmQViMv
	 r+w70HSjOFkOQ==
Date: Thu, 23 Jul 2026 16:28:49 +0200
From: Vincent Jardin <vjardin@free.fr>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 1/3] hwmon: pmbus: event notification with alarms
Message-ID: <amIlIYP3fcLh0h_E@L30177.local>
References: <20260723-mpq8646_v0-v1-0-14363c75916f@free.fr>
 <20260723-mpq8646_v0-v1-1-14363c75916f@free.fr>
 <20260723131352.182B61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260723131352.182B61F000E9@smtp.kernel.org>

Hi Mr. Bot,

> This is a pre-existing issue, but while looking at how hwmon devices are
> exposed for alarm notification, I noticed that pmbus_notify() might be
> sending notifications to the wrong kobject:
> 
> drivers/hwmon/pmbus/pmbus_core.c:pmbus_notify() {
>     ...
>     sysfs_notify(&data->dev->kobj, NULL, da->attr.name);
>     kobject_uevent(&data->dev->kobj, KOBJ_CHANGE);
>     ...
> }
> 
> Since the hwmon attributes are attached to the hwmon device rather than the
> parent I2C device, does sysfs_notify() fail to find the attribute and return
> silently?
 ...
> Would it make sense to update pmbus_notify() to use data->hwmon_dev->kobj
> instead to ensure poll() and udev events work correctly?

OK, I'll fix in v2's 1/4, wait for the next,
"hwmon: (pmbus/core) notify on the hwmon device, not the i2c client",
both sysfs_notify() and kobject_uevent() will target data->hwmon_dev->kobj.

Best regards,
  Vincent
  
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260723-mpq8646_v0-v1-0-14363c75916f@free.fr?part=1
