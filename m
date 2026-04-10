Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69713D9DBC
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 15:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775834982; cv=none; b=cZNpUqF+nufuAxvaTc9kiocXmcVsn0gSf6XgPtc9rYzVyMX0W1ht2k2SDf2/HpdXiGp2gxyZhQspNDW/0uBp2ap+hUEVecLOc0GQVCFeglSaTIQ4U2aST9CRuJi7ESd2uA63Cx1pOSicyf4ZYE7YK2Awc0xxW0ceEPoCvLCjuwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775834982; c=relaxed/simple;
	bh=pMVJg16RiU5xetNeImXRVz5ocYzhoxQRKuIB3kbckjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxeBVuZD+ikdcMEDtigw0KJcYYQifiODP0S7M6f22+g+G0YMgEs/8DhKqjNlMqDIxTvBGNPc10/EVOpVnvCEDRSvDtejUcT+egwzsLjtHnmIjz/wn5nWXdY8XH/7WsMN6Ow0GqoGFCI8uRCt0JyZWl1/vAKLLe9czdqZDqYQrPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hW30GnB3; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hW30GnB3"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c56aa62931so3504571eec.0
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 08:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775834980; x=1776439780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQBjqJfFbgAgcp+e3QnLHrvx3vq4o6Y5iRDazMhYwWM=;
        b=hW30GnB34mLaRyAS6fQWWiiIWJ1cotd0NphKa49gb90w90So57o6QB50a92dMTpoO3
         u9l0jLC0nBQneRX648/5oXbl4l9EDYlmlRpi/8Wr/IkaUzxH1wQ7CliJypp+iTq6TN/2
         mqBYu2wXMBC34NcDHzaydBQ56x/3IVBZZuiK+CnZz7UD1QcZU81zwu/Y/WOUWwIkgyRA
         tk/0E+HRK61Pgb82ZXTuh/tO0C/uj6rhxahSUw8JAOYPzf6lzxxK14UfzwIi5/MECSOT
         CzM5t+8iV/1gVgblVA5vcSkMAnvJzFyONIkMlYzGQkarZhqmQeHcK4ZDsMIiDfzQLqKl
         7/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775834980; x=1776439780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bQBjqJfFbgAgcp+e3QnLHrvx3vq4o6Y5iRDazMhYwWM=;
        b=SjKI/nxiqO3xOqdLrjiFbovSzlDe00qXFR5N/zDqkuGm7amRk0zCq9v8amL5racPTL
         K90gYnoyFZirGCQLsrjqWXGX48cXlLmkRRL9ems3pA8nQzH0sqDSQmuM5pZZI1r4gpnf
         1t1nkc2beCu+WvpwDttWslbtpE8nCWHqUuDzu8lhFFsXtF2PMm3UKvzpne6dxoXc6+F8
         Z9he2pdl3s4KCAlcs8Z2SbrX0fedxZw0jm9CLlfj/RUiNIEwtRHvJjRhSFvqhh8xvjHt
         b1aFlQwrOOtveYSBeutQeWtTyn+YRaQ9JCNqhPBLWAqENbdcPIj3PJpgZaMk1Sja/qxB
         faSg==
X-Gm-Message-State: AOJu0YyzBlzy5d+/qT+6CN5q7JTILGvd2/l/u9W2Ama4x4PgqTDvymSw
	XUCzFRwJRgJDq0YA95ewbEwxv5Xzm5nvYIEBiCpEdyV842JDln8iDwTf
X-Gm-Gg: AeBDietnNuSIPx1QHGH1Uk4IEbgc/aWL6dOeBqhEG54tVkDcMvmgrb/NuI+akfLL4Ef
	6p5rDwA6ZRwqPbmE1ELgyOOb2M824rMm87JBSwpeSqBzto3fBGd3xUNnmDoC0CU0sdAASshE8Zo
	dZz+Te2w8Y6hyX6F0tiQ8IX8klXGPPTCyhOtlEos4wZyo/Cu7i3AWdwGYAbJBYqGhgXbl/EVTud
	vwGEFlCpUXKTaV0sS7fdEcUhbcrv0FqsWXie2ZmGhpXZIP0XSKr3kttv8Tu7EcAF2MyGiQLt6sM
	56fSnCo43ShYjQC8hXbChTNy+jo2YYNYpVS/L+of6ZwKHilJ5osSkHS+y9OWNle2oFHZPXQ2Rvc
	pcrUxpvSU/WxOD5qsyRvhMPdZwum0Ft0Uw7JniBmqMuMwuip5+sERAkK3JbYMikXxIFhZitRFkP
	EjQ84zUmOno3naEfdd3LeIJwgZeEDHRlcqr/+l
X-Received: by 2002:a05:7300:6da6:b0:2c7:8e1c:956a with SMTP id 5a478bee46e88-2d589662875mr2131999eec.19.1775834979965;
        Fri, 10 Apr 2026 08:29:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561cd2c09sm5743556eec.18.2026.04.10.08.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:29:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 10 Apr 2026 08:29:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux@weissschuh.net" <linux@weissschuh.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] hwmon: (powerz) Fix missing usb_kill_urb() on
 signal interrupt
Message-ID: <de216660-de50-4a00-b244-c315ee040cc2@roeck-us.net>
References: <20260410002521.422645-1-sanman.pradhan@hpe.com>
 <20260410002521.422645-3-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410002521.422645-3-sanman.pradhan@hpe.com>

On Fri, Apr 10, 2026 at 12:25:41AM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> wait_for_completion_interruptible_timeout() returns -ERESTARTSYS when
> interrupted. This needs to abort the URB and return an error. No data
> has been received from the device so any reads from the transfer
> buffer are invalid.
> 
> The original code tests !ret, which only catches the timeout case (0).
> On signal delivery (-ERESTARTSYS), !ret is false so the function skips
> usb_kill_urb() and falls through to read from the unfilled transfer
> buffer.
> 
> Fix by capturing the return value into a long (matching the function
> return type) and handling signal (negative) and timeout (zero) cases
> with separate checks that both call usb_kill_urb() before returning.
> 
> Fixes: 4381a36abdf1c ("hwmon: add POWER-Z driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
