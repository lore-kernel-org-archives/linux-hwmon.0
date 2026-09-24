Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE534A4998
	for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2026 16:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266469; cv=none; b=HDIzLWND7UvUtaVPpoKyZAs3EIk6GJdF3SPRXI0cgly775JbhwvHx4JRV7dY1EVnlAS/r1z50DUvEHXpC7BSiML6TTcz8wDpBccj1WNgCDT8RRppf0OHNnGsYe9XpGhMMSpbzzHNsALE/ol4takoIROLbEwmz97tu/p6kJQYxGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266469; c=relaxed/simple;
	bh=4KycQmv/y3uSOW6bbpMEKLY5l9Z72oT4ziHVMe1/+K4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TW5KAvflT1WheKQG+DFVDi/4cdYbyT2uv2BQntCw+E44MiauN/pSUNcEfkI0BpW+mIP8t4fKF6No/Ip4igX6Cp8TVXMHcZyZOlZDIgW6gylGyEs3CCOSSwAnnbEvWSVDU1M8H/K5AWIZx6BxY1wWc+pnUTq8pKCKjikKiVxTe20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CQ8Rx6XA; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQ8Rx6XA"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2df8de41d6eso2244325ad.1
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2026 09:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790266467; x=1790871267; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4N81IHB88R7EO6e16xVo7GeqgBSbrBSWBWPmQpiEIqw=;
        b=CQ8Rx6XA3AYjsUUT1t6pOx67T9ImQwenLU/JvI/0SzINPaXhDowjNe+Q2corE7Q8Kk
         nauYf5iuUny0EMmTVb0IaDJwOMJC9WiCxQ+IXII5De1Mb6TS8hsBmnWJuJoBTAkjJKV9
         4leE8jDf/FOwKkp7rxhwh/YlgPWFMKNHRK9I1b716fpinWOFX1IQYb8eavKEsOJ9SeZQ
         21Yuw4dbwsdIqbSEOA9f8H9o0gzV76eMCwmR4t12e0PGkaRGjFyjAaZGSFUht9hp9Kh9
         dFdaxPf3QcBDjkXcnRTB5V/qy7hxaT7WpF54LwjoWNW4yO0k+qn8vv4AXa2k7C3yENlY
         LQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790266467; x=1790871267;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4N81IHB88R7EO6e16xVo7GeqgBSbrBSWBWPmQpiEIqw=;
        b=TtMVD3p4YdqhfO2aBpLsaHMh5451SjzDKErJ4fnEhKFVHwf2DPH7K4iFI92ty//dAA
         vYNMbcgHG6t7eoeb69YvIoRSrJiPHhmUHxgJDwB/4qzmh1CTFL8Vt3UysJfIEo58tll5
         JaJ8tKc+43VfVaEZ7+eOB1f0a/2J9oiFuVTNjhYqFhXPDngmKTdnsnKZOsi6PuwyWEgP
         bZOA4+rtygoM8sn1fRxP8mY08KWopH6GtcHIJ4afS5l5bGDvHpENylFLbTtJlb/W7OK0
         KwDX7neb8vZv7qVkvstgkRpDGd1RSMwBhN/1kt3N7eZorrwbhQzgI0ZJmO+atwkIgClp
         zgzQ==
X-Forwarded-Encrypted: i=1; AKwUvByBxKwthJD5jdDnyBCa+7Dq7bot/GchLI47v88LhhrMd3JfR93hEtudXjiwBbW9SHGxyuMBX1l/btXMgg==@vger.kernel.org
X-Gm-Message-State: AFuF++mhxruy/mxN3RMkXPR3CVlXymeouHZMFDfGp5/hemJms88or3bB
	BtTGq+/ohvP+G7BnF2EShJde37/9VXMRwz41eWN8/eKfPQhDXEwx6vVB
X-Gm-Gg: AYBFou1H3XgzJT9MqV49we/f4Uv3k3BWDqygFgZ7/vL0UaXYbKJ5qjcsTu1TZqt1do2
	wT1j2/23BSdOnnPDD9V6uc3ZZzbFxn5Q5C1G1ccecfuzuleTVFxDdyxkwrrE0SAzvmDyb9/9TUh
	dQRaGTECzTHCQjQ5bhAzWxGPN7s4dUXWFTC61Hj5EYjoSamgxglUif1rpQyiXwKTzQ950KW+cZp
	9sjcNunsJmohUr4dozSWPbrMQqMa2POovne3GhEuM8fK/BkvPDP9PFyo8q5HezAZ3qVC/+jkMmx
	4B/p9q7Jz0EpEux6bAuJ7N7plyzGeWzTkHtO+G1veN9HXWL7psLugS7TuppPTgqjDbLOXH4SvGa
	dbunJ2rrQiLoLZKlETmhGkejrT6RwNzIBbE14id/jDBmkDFifWobfqm9c7ZZi3Jfk+iwNJqlqux
	T+NomaSUAuUAgbAQtWF/cYVmH70YZjuNvcnZX5JNZkUAC2pSYEZH47QGCxmOWFO+DDelIRb6C59
	jyk2qyrjX5/
X-Received: by 2002:a17:903:2341:b0:2dd:c053:c20a with SMTP id d9443c01a7336-2df7dc19ecfmr25831085ad.38.1790266466910;
        Thu, 24 Sep 2026 09:14:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5d7a48sm30509205ad.48.2026.09.24.09.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:14:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 24 Sep 2026 09:14:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jiale Yao <yaojiale02@163.com>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (gigabyte_waterforce) reject short input reports
Message-ID: <bfd9924a-fe78-4575-8e9d-2cc649413e47@roeck-us.net>
References: <20260924151133.1233860-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924151133.1233860-1-yaojiale02@163.com>

On Thu, Sep 24, 2026 at 11:11:32PM +0800, Jiale Yao wrote:
> The HID driver raw_event callback runs before HID core validates the
> received report length.  waterforce_raw_event() reads the command bytes
> and then accesses fixed offsets for firmware or status data without any
> length checks.  A truncated report can therefore cause out-of-bounds reads
> and update hwmon state with data beyond the received report.
> 
> Require both command bytes before identifying a report, then check the
> minimum length needed by the firmware and status paths before accessing
> their payloads.  Commit 47669bec44fe ("HID: asus: refactor the two
> workqueues and init sequence") added equivalent raw-event length
> validation to hid-asus.

Oh, and the reference to the other commit is pointless.

Guenter
