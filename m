Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56402360ECE
	for <linux-hwmon@vger.kernel.org>; Thu, 21 May 2026 03:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779333730; cv=none; b=pdRj3AkFmQfGuRFzuF1e6n3EY9D6ypR8hk2HpZvHqGyUNR4bKrBZ9MKjBKxiq5+ddQN+nlQsKSPsNFnyBVcwDfZrlvXMF+bPKuQ6ztfWwM4MycAo10HzW/UhVfDC26Nq3AuDzaa85PPJTnq7hyADKCJRb35O2p/iqRwiwJEZYzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779333730; c=relaxed/simple;
	bh=rT0DDiOFU23Sl/+klDBdvm08qO0CSzzr2zOGdeP5h0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EeKgdhE8uoy/0qzKhcRHvut/1WZnXc4WGS+yh8MCRWRA7iCY8SZC+dciCisiPOCLTkD4q4u+ccLLf3HdTyEWQWLcf3w4C8Sev9U92R8EdKVBXGznJ0uAqOfW9BL9Gp45xyO0pW5XZTqH/v4oQKsH1F8AJNgRJ5rDgLJwBxsbAJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WW11gtPJ; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WW11gtPJ"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1331e851faaso2951647c88.1
        for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 20:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779333728; x=1779938528; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PIGRgQ9T1M+3zEPv1bzE3jMqNcagOXZzTMHd5WSp9Es=;
        b=WW11gtPJbQKD5lUb6nlMyXD7MFfjiiRzP+fI2AkgiVVF++GM2nyC1gog6GKHOboWd8
         R9F171nISkjLRH+MLkr5gOlECPr4JAVD4Km97y+YXjlMOYbHGcWUyxPsYl1ihkLbHDNU
         eEEbHXIoU6aYKu5aEHD+Ilg01SrV7a5M/bXbNdCgJbU7AeV2v0BbbSVOMN9Dn7m6ucaM
         V4vbBoPaPYBZCLmFS/jJAw1l61ZpyhkAbLCVUSchuEuTf0SEGezvoh/Y2mIo8n3vsnQ4
         gJTQbAJqDhlkDXnYhbRzgj8/tNa8ginnVVLcvE+DS1wqjt1DGcM/TvsXSayF5iCEA07f
         4u/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779333728; x=1779938528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PIGRgQ9T1M+3zEPv1bzE3jMqNcagOXZzTMHd5WSp9Es=;
        b=g+wsKKB26MwetSLRrvLTIrAXJ0GOCuxxmG7AnFzvPAvKcgUUcZARJcG0Ks+12Gp+cY
         DoPxshdmMgeeItlkZNWGVeun4W9MVQN3C/a8PrwkOO4c/wifoxc/a/bg90RaqwB5mWBc
         gK/KMvtJsrs83xAz/WWLQpGq2EgT57d+VfEXAWXziihBPB2KeoIQsvXCPtnt4pJ/iIRs
         SnInpbu74487UEQGjCHsQ5VO2WYw205HF8U5VV9/UTYmn1VwyDGWpkxnuWiKicwedH+p
         OSVY+KGtpXqa6u0L0LWwVBd5MqcgGfZyoRgps/bHl3kid+bVPglfy+QEiUJ63Bstocc4
         bY8w==
X-Forwarded-Encrypted: i=1; AFNElJ9D1n1EIpyghXzTfq0lCGlFwvZlrlF8uPcHJ0dcWepVlHzmNb+akB++ShV8sFNOZHdwCebp6NsjKzEYaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYjcLSgGrOHz8YX/BIN1rbx2GGKuw6qx5QeiLyUUtGQo5YcWHc
	4qUfYcnquK9FryUGMmn9FpdOMukW3g5xSLygy5Rtn2UeF7buazdGUaGe
X-Gm-Gg: Acq92OG+opwRG6qZ2C/Mgi66jzO5GxJaaf5/I3hh23YaGI080q+FNlmHQjSc84lK2Uw
	Mn2qLAh7DRZZUIroHuMzkaZ7sGgKuquh4pLbIGkQw+CGyaCTbsSh/4tDrCr+ldR2EhO/cZpvR6G
	iKVjW6anNWp3SreE8ABjZoA/izhyEIs50UYNBExrDZ7xJdps+3ZtTMc/xqp2nJ//G4anpLMqbNh
	sBR2FkBjqKu0AGuuxib9K7Ca4aOY2Wixi2jxZGJntZIkduXNYlHt/ByU+ZYWnh/3ucz2tCRdldE
	JhX56A2oKJ4D7W/+Y1eY4RF5KvA9eLFqth9QwRioczCxpkZ7Hyxhu+1x1dl5jZxWt3rDYnveB1/
	7cxSWzn9EKieBH8aI+na6CK+bBQZHrLtl4IcrnqDw8DxsdW84Bnz2PNgL2hNcQYN8Du2CAKqpZ1
	9l8U6BgvXD7bTsJ8ocKJF7F4o72qJRB4tezKZy
X-Received: by 2002:a05:7022:1a84:b0:12d:c4b7:5625 with SMTP id a92af1059eb24-13634b58a0emr416891c88.9.1779333728267;
        Wed, 20 May 2026 20:22:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed531esm26747008c88.8.2026.05.20.20.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 20:22:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 20 May 2026 20:22:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Alexandru Tachici <alexandru.tachici@analog.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] hwmon: (pmbus/adm1266) add rtc debugfs entry
Message-ID: <14794306-c26f-43fd-b396-790facb6f3b5@roeck-us.net>
References: <20260520-adm1266-v5-0-c72ef1fac1ea@nexthop.ai>
 <20260520-adm1266-v5-3-c72ef1fac1ea@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520-adm1266-v5-3-c72ef1fac1ea@nexthop.ai>

On Wed, May 20, 2026 at 03:42:42PM -0700, Abdurrahman Hussain wrote:
> The driver seeds the chip's SET_RTC register once at probe with
> ktime_get_real_seconds().  Over a long uptime the chip's internal
> seconds counter drifts away from the host's wall-clock time, so the
> timestamp embedded in each blackbox record stops being meaningful
> in wall-clock terms.  The datasheet recommends that the host
> periodically resynchronise the counter to address this; today the
> driver has no userspace-facing knob for that.
> 
> Expose SET_RTC via an rtc debugfs file alongside the other adm1266
> debugfs entries:
> 
>   read  -- returns the chip's current SET_RTC seconds counter, so
>            userspace can observe how far the chip has drifted from
>            host wall-clock without writing anything.
>   write -- the kernel re-reads ktime_get_real_seconds() itself and
>            pushes it to the chip.  The write payload is ignored;
>            userspace does not get to supply its own timestamp
>            value, so there is no way for it to push a wrong time
>            into the chip.
> 
> A small userspace agent (chrony hook, systemd-timesyncd dispatch
> script, or a periodic cron job) can write to this file to keep the
> chip's counter aligned with wall-clock across long uptimes.
> 
> Both the read and write paths take pmbus_lock to serialise against
> the pmbus_core's own PAGE+register sequences and against the other
> adm1266 debugfs accessors that already run under the same lock.
> 
> While at it, drop the now-redundant adm1266_set_rtc() probe-time
> helper.  The new adm1266_rtc_set() callback does exactly the same
> byte-packing and write; probe just calls adm1266_rtc_set(client, 0)
> (the ignored @val argument) after pmbus_do_probe() so the
> pmbus_lock acquired by the new helper has a live mutex to take.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> Assisted-by: Claude-Code:claude-opus-4-7
> Assisted-by: sashiko:gemini-3.1-pro-preview

Applied.

Thanks,
Guenter
