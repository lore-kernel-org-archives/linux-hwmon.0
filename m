Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52474242D83
	for <linux-hwmon@vger.kernel.org>; Fri, 28 Nov 2025 16:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764347693; cv=none; b=UqhgkzFdM+QKsJA6M+H50lMpJJW3lDtMnHwcxWug8hNpoPv0RSsruJ9STeG26vhtDJyfTL7VhSy/JRh9LAIk9/eBAGgwKK33zGuYSNCvnHvl36U2MT3Wwd0bh2cZSn1aUmVpmoQytb69j9EZd7/TJ0eDBYbw/P3xtKx11Q+5b5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764347693; c=relaxed/simple;
	bh=GXH1cWPdGus4O8oVWZv/sxdK/JlLC1p3HxJzlpZFPDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7g0qw3XwZnWr7UDxq1rjhAk1sMiAjcJxF8yJIshqPULp+i6muqUAZZ+EHSwbeu0OpLgFblixYSyuiVCK3AErz7dn/qAq6+oI09q1rrMQM78zPGY9W5/JTozGOQBaDdBudD1HJ0sIa78h9xGxbsdzbMpp3LKb5x6MpQVOncXwH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TLluKbad; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLluKbad"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-297d4a56f97so29777495ad.1
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Nov 2025 08:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764347690; x=1764952490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PFmk9hlrvzIMQ9F/XPguCU52S/7ZrA0XyoOyhl4nsuw=;
        b=TLluKbadMCGr88g/x2llq+qT5GyW6r6J8v/tBctvbh1gobzLq1j6QQdyjwJE2BsoNs
         S6d11YJdxowsdOrmkajG3n4B55JVOIi8cTC1zAQiMa3rPNkDOdvnZ+Fpgz9Gm7KN8giY
         Q940ozf2f9eIZCuF2mpBS94TNUQLbYihI5dugIPjT7gz/3z8u32bVZZBin5afeTHQs/t
         9n9dXZzgilE5gFH3Bh07n6xaI9vvK+e58ROjK4vZBRwSP6cRiL2yMMOPF3IgBaqWSY+F
         iwTMRHpZT4kID7Y3FkVU8HSlZCau4rZDtiwep0ROpNbCtxU1eEO5G5fQ7Y6HXWCnt68o
         vUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764347690; x=1764952490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PFmk9hlrvzIMQ9F/XPguCU52S/7ZrA0XyoOyhl4nsuw=;
        b=Rp9LXictzllg0GF7pxvjuByGL2UAsAZRkpZAMEBoGZYptas+HMEtbWlTzd/4ydgJnv
         7i3LaRq2za+S3ZMRMDgovKHYMIBBX6syny/zUzNNEav/EHSRAZoppNWoJeONZcSH8uWM
         g0oyG1fKXjqvWuZv1ui/RRsMXVieeN+Z+IcTNMPsBxMz2kNt2ajd69v+1+kwCGPi+pSP
         5odwcb/8BIbchJCNc7KLDnSe3lDQYS6b3Tg5AHOf3jac7YP5X5jxqIZ8eQ3Cu9UkYCpI
         Epntu4nRASsFst58diCQMwh0ffhVSklI1EBol9HM1Zhg6BARBE0oBijjAGJa8FQ8g+uK
         NZBA==
X-Gm-Message-State: AOJu0YzhQxFaMYjycU4SrXjpPJsE3vcRUejz79bU2+2XQwOSNq2bWeHr
	mboTDbGkbvABhAG1/+xJO0/f36UY7paVbQdycA5ioHQewzGIet++OWlB
X-Gm-Gg: ASbGncsrth7BlfPTezdoqmaYexQ73hbzGctusyd1hxXT5oQkd+z9F5O9pHYpaqB7ue9
	K6SvONu/U24kFV6wewSXVkNlS11xtsVWtLtDJZn3BbuwE5LNR2up/DEMdP9EU8XSzX+zTY3TUfX
	/9hfjjQ+3HF7eGTzCUZ+pS0InCnfgjoe/WKoCqwxAUyqg8kI9j1MTGtHR1PEOoqWfC+4NcWAq87
	GA7/gD65GwDDUGEmCrr72jCoBo+Ni/bnV5ZVwIKxz3hRUBNNsgTKXpmRXLckcn7QAPy0UifZhM1
	DtWH51wg0bbH/ggIj8D/Q3IZ8ghOp2UZJZo5zNsg5XOK9xF8c0mRfLEtJgYW4uzXajrH75Z5tZ+
	iVm6hn4Ir71tE6kLWLzgrbX1xpa3P4KdbEyCfKugRi0349V7yR20CGmI4KdSW5oUNEgKlrTC3Q6
	/PLo5qkbgq59pmFMfcREKAxTs=
X-Google-Smtp-Source: AGHT+IHSE4V0DVDx+1WJxYLX/1UcOOn/zoR6YvJ99VgXvbLfW9lqG/mD60tGkXaEnTc9gRyYW/IiAA==
X-Received: by 2002:a05:7300:2716:b0:2a4:3594:d545 with SMTP id 5a478bee46e88-2a719d5a9d5mr13034270eec.18.1764347690279;
        Fri, 28 Nov 2025 08:34:50 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a9653ca11esm16442454eec.0.2025.11.28.08.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 08:34:49 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 28 Nov 2025 08:34:48 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (max6620) Add locking to avoid TOCTOU
Message-ID: <f5a0e99d-306a-4367-8283-b5790a74dfcb@roeck-us.net>
References: <20251128124351.3778-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128124351.3778-1-hanguidong02@gmail.com>

On Fri, Nov 28, 2025 at 08:43:51PM +0800, Gui-Dong Han wrote:
> The function max6620_read checks shared data (tach and target) for zero
> before passing it to max6620_fan_tach_to_rpm, which uses it as a divisor.
> These accesses are currently lockless. If the data changes to zero
> between the check and the division, it causes a divide-by-zero error.
> 
> Explicitly acquire the update lock around these checks and calculations
> to ensure the data remains stable, preventing Time-of-Check to
> Time-of-Use (TOCTOU) race conditions.
> 
> This change also aligns the locking behavior with the hwmon_fan_alarm
> case, which already uses the update lock.
> 
> Link: https://lore.kernel.org/all/CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com/
> Fixes: e8ac01e5db32 ("hwmon: Add Maxim MAX6620 hardware monitoring driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
> ---
> Based on the discussion in the link, I will submit a series of patches to
> address TOCTOU issues in the hwmon subsystem by converting macros to
> functions or adjusting locking where appropriate.

This patch is not necessary. The driver registers with the hwmon subsystem
using devm_hwmon_device_register_with_info(). That means the hwmon subsystem
handles the necessary locking. On top of that, removing the existing driver
internal locking code is queued for v6.19.

Thanks,
Guenter
