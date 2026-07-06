Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345D727F728
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2026 13:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345817; cv=none; b=d7WfyB9KvehTJ6LnMJDbPw1v08eTKw4vj+RHcK5vVzPAeSR+QOn7RMMu2u+eDzfVsAxDjlYemBEC7jbxwae7wjygSGBTTlXz4Z7IsbvqmBHqyOvk27xX9OschR8WqP6x5Utzyg/SRDLzvceyM3J2lYleOtkAt7y3h8CF4PtHzPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345817; c=relaxed/simple;
	bh=cfEQ5oirwlDZwWqWXlZ2ec3fN4r4v+L1Bsv5+igbND4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pBVIeLpLL4PWhDlyYzJ2j6uIZq/NDv/+M4Lu6OYpz+XDVKavvqgWTEWdPETNmp2GYqkcwlcm8kyBESB6l+EVMCRhaFsJM3Ygwqn0MSl6rd5btKmxwXITC97tD2K3CK0q69XmgnfgnitMi0y7idKyJxztQV58Sd4r1icbH5aJqvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=marYD353; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="marYD353"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c8fee9f63d5so1645114a12.0
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2026 06:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783345815; x=1783950615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O2/JQDEja/6xWoRlPU5jhPNbz+DyTQo6R1OxX+kO6dc=;
        b=marYD3535Ng0K5oY+/hmEhUjR6jHmzPuYn5alOexgIslFfFnr7tqOfCzhkcw/F7nkb
         9HC3eeH16br5k3ZoiCwrtPqXyj28ocsJQYbc8I+NUXFPtIKNLa3BeTogHXFk8TlmH8ay
         fj+VZwtP5bA9FLXBSMLuURcKwlO2RyTeEcS3GEbMm//U5sa4ztl94xqULqsSTb8zUmEk
         t1i5Shm6HDbGgk6WM4YEguWZMHcIY9L1OV2gslzWgHqCnMJfWtSGgLVMYMgie7LJscvR
         kKsZUprOAZ7Vb0+blP4hoCTzzol8iEr5eoU6Iw78T3s57cSIE87OI4ViNTYNMnsQ84Nk
         8cXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345815; x=1783950615;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O2/JQDEja/6xWoRlPU5jhPNbz+DyTQo6R1OxX+kO6dc=;
        b=kLoweV+LHROFhsNXtr5Vc331jjnUY+pUPToCPNrqMCNmjAC/0dLzrwCkxPMK7a/wTy
         hvkS8D8PsxJT+esWToNO3AEFWpnhj8AQhDfH0YRa8NKfy2wyfKKOQ9HLDEU1Y3gs40SP
         g87W2TgisL1j4beG+WH01X+wg7N5dfuQ2OHbdBXBpVZv1M6xmmNk+XaG/HvQXkUWw0oH
         pOvlVLhcbpKeW3xm3aKc2wUKGJnMfhCPFVWL75ws93qTQMCDyh4pyCmgSYRDXuKRU13L
         t2SYxlLruls9JlD3+E2q2z5BIzBvxhiMN/79owLNkLkf2xg5X6sv65+Mnxr1SuQC7ZPG
         +v/w==
X-Gm-Message-State: AOJu0YxIqod996lbW8VZxsIwmv+b03sKGDUpTigNu6pwM4+OVo0rykrx
	LtWy+eUN/ehbucoRB3WPj0/9VLCSRW6dfLPWV8GgRfnfhfOwI426FqCc
X-Gm-Gg: AfdE7ck80uUu46DH+m0JvEkxa/E7u4Yg9oXpNCJ/roRfpHJmAIr0B/qo8z5u8fb0REJ
	T5bBTQ6dyFWpi0+QpZOJzRWyae0C1jaOk8uqOhTsgfNgk8Y7Wffoxw0uMrUOS/OiqNabZkTX0yb
	bkLAdPPVSFkY+pmkT329RZwbhDO08FQLb6mQOe9WhrvmbQGbix8YIJPPY0LEVPR8gOKNbiKLaw3
	IS9I1OzE5UyfDQg4S+PySFmp8InGb9eXHWgDKVl2v1+xNfeV30gkNM6H238kPuwdsdghuHPlrbY
	DS+WAZuhXRQnCxu7j1xNajItie319t9Mdw4+M0m3Zx6kFUCERSznM9cpskbuh8DsSChA8RXKh9c
	NCXyWp4trX6Xwp0dazif27zl1GT0zknefKH8/AqaBwDI1m2SBOpvk/qlyDLHFSHQBGLjsGEgn5z
	E5lVs9Zu6JgUTRzpFJRqZscnZAUQ==
X-Received: by 2002:a05:6a20:d807:b0:3bf:65b7:22d9 with SMTP id adf61e73a8af0-3c08eed4542mr801601637.41.1783345815467;
        Mon, 06 Jul 2026 06:50:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e91b07639sm6090794a12.21.2026.07.06.06.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:50:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 6 Jul 2026 06:50:13 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Linux ACPI <linux-acpi@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] hwmon: (acpi_power_meter) Stop setting
 acpi_device_name/class()
Message-ID: <e3c2f512-cee7-4f55-a1c8-8bbfaa655159@roeck-us.net>
References: <2297496.irdbgypaU6@rafael.j.wysocki>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2297496.irdbgypaU6@rafael.j.wysocki>

On Mon, Jul 06, 2026 at 02:35:51PM +0200, Rafael J. Wysocki wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> 
> The driver populates acpi_device_name() and acpi_device_class() that are
> never read afterward, so make it stop doing that and drop the symbols
> defined for this purpose.
> 
> Since ACPI_POWER_METER_CLASS is also used for generating ACPI netlink
> events, use the "pwr_meter_resource" string literal directly instead of
> it for that.
> 
> No intentional functional impact.
> 
> This will facilitate the removal of device_name and device_class from
> struct acpi_device_pnp in the future.
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Applied.

Thanks,
Guenter
