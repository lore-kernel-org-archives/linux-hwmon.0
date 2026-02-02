Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA66137419D
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Feb 2026 16:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770051518; cv=none; b=fhBG4WbcfZWtJ5XrhosmJryGE7NE8tvlJeUrGUer13olje7r5VcMMFhEoRPimLexZogVematcMXSMlNpynrsvenHOe0wgCAhFF6ZsKFRK9CALsiGynxqhGrQCozR1er0+h5uQHYijxPmiStJogK7vgDQVlqThyYsHn69lMSOaEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770051518; c=relaxed/simple;
	bh=GlaPGEDFHyTZ2dS4emy5gCI3JVppCamAltc18GwikYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ehIoQ5M3y2WbSKzPpeqN8A0MR8WLaOFDdLNQ06JuMoeB2tJ0PZnrpTWOKBwoGFZvoOnF8LRqZOmKqsmRDSKoKiNZOC2BO7aTY6JwkXEwmB+g/fDhKFyCajRwyyhQYQWCR6iJ4A7hw36/SR1ohkbZLz6vNw5npBdwLueE37jwcwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxYwA+8L; arc=none smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxYwA+8L"
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-2ae2eb49b4bso236538eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Feb 2026 08:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770051516; x=1770656316; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmmqstkUFuOvTFjtVoWL5THYOk8yMG664rkSQV/BOG8=;
        b=kxYwA+8LFTgxJMBozyJpuwj0TDLH/QTemTJcIH0SdZupfTO3LasXC6z7+XmO8vYtXy
         UfofB4qWQ2GqjA7V9y0+DC/E+hPhzbSaDlo5cwgt+eCFJ/BrM2MK7PmI1TsIAZSwAJaK
         4US/U1phWc4iN+aoCZg8LplLI08xaCw80yNQhI8qS1zEa3dZzSNDCOsAqsv01KCdvTiw
         4vsLRokCKAClXGP9o1xAnMuJQdG+/FZ/Jzkf5/AJqiph1yqsoFnZJ5uya2nJgMpFnz/w
         iKlNoHi9NDlO29PM/8d+xp8jwlepzaTZBqtGDmUm4/nX/LJqeHQAE81q6vOwbEOWN1fB
         cfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770051516; x=1770656316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VmmqstkUFuOvTFjtVoWL5THYOk8yMG664rkSQV/BOG8=;
        b=E/FSZFRBXmgas+xvh7GGmQEi66Fh33PLC3s5i57fZLU/1ogZt5QbYk0zN/cO+1zBuu
         eb7etCmiAOIlI2/8ypsDHQFzzdu61k2c0ICtiGiRQ1I2S+BZ0/I41vc187JlONHqW5yn
         ZG3lef3oaSThTuI25n/rRDuHJ6KFj+V3uBhV6MZGlbkUhgMe/WVaXCzWteusoR7u5aBA
         sUp1FBNa6IQaXbZvbo812BbkxCLnrVV8UTLlbJRs5UeLT7M4KjPzPcj9WlA3omiyh3zl
         +Fve7IBL4p27Cu/PXgSZ+sJXidWd/HlNhU0nzUNfEGfBX9+Uy9cxzrxAYKca8HKVxVg/
         OU5g==
X-Forwarded-Encrypted: i=1; AJvYcCU4ryEVQ9yOghRwhMDMlY0j+u8LIk3vMnCrhKyNmLLZbPb/fYn3yqTLDUt2cyf7Wjg3VGiNOA7QJp2ZPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHosjVzB/6nfDvTZ9ctGO1LIsbN/8ohH3Ug2kpQvzVhz+GSsWZ
	lkmLNEjXf156bwEOMP/Z+YXhqBbwgCXimp6pDpcnOCOnSRF1c0nvG7VSG30gecfIP+Y=
X-Gm-Gg: AZuq6aKSRdsXvxMKF5Z5mGwK+VGV+zNtk3Vbl19dGO1PZy7Nfl/HNZnrWmmu18ohexn
	9dklKv9iNUiwd3aLFRzKvwpNi7shOiDyf3CfXkXkSRhQuvCeTk/Ui5Sh7qG38DVKEJOkSCS8863
	eZQHoEhi2T4djR/CL/VbiGmG6eRsb7L9griN6gJnaJ+fjJLRE6MQaoFqCfVUjDhIEkH86kDcvdz
	yDwJqgKUGZSHBV37NIqZk9JeiKzf8s0sRY1x909UTemmobSf59GjHSsqAijx76x0Tp4AtvhCgap
	0QB+Um2HDY+b6ypRQXCQnuOvVMDjtnWR/fq69w0HB2/80eH7fDP1TCBEAa6FEJBl/GAufRO9y/v
	kTiYzUkRsrSpnJjqsBfKSQy5QL+zMXOleXU/xYaKVjxQf+cqlA651yx9S1zC2WdXoS/Du9q5dFF
	K7nfjpHdN7EBopuOQYt5OWlFVZ
X-Received: by 2002:a05:693c:408d:b0:2b7:ee0e:e9ba with SMTP id 5a478bee46e88-2b7ee0ef555mr2160005eec.10.1770051515371;
        Mon, 02 Feb 2026 08:58:35 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1abedcasm20353466eec.21.2026.02.02.08.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 08:58:34 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 2 Feb 2026 08:58:33 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: gpio-fan: allow to stop FANs when CONFIG_PM is
 disabled
Message-ID: <12798a6f-ab17-40aa-9b0c-eb44a2684ce3@roeck-us.net>
References: <20260202-gpio-fan-stop-fix-v1-1-c7853183d93d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-gpio-fan-stop-fix-v1-1-c7853183d93d@gmail.com>

On Mon, Feb 02, 2026 at 04:58:57PM +0100, Gabor Juhos wrote:
> When CONFIG_PM is disabled, the GPIO controlled FANs can't be stopped by
> using the sysfs attributes since commit 0d01110e6356 ("hwmon: (gpio-fan)
> Add regulator support").
> 
> Using either the 'pwm1' or the 'fan1_target' attribute fails the same way:
> 
>   $ echo 0 > /sys/class/hwmon/hwmon1/pwm1
>   ash: write error: Function not implemented
>   $ echo 0 > /sys/class/hwmon/hwmon1/fan1_target
>   ash: write error: Function not implemented
> 
> Both commands were working flawlessly before the mentioned commit.
> 
> The issue happens because pm_runtime_put_sync() returns with -ENOSYS
> when CONFIG_PM is disabled, and the set_fan_speed() function handles
> this as an error.
> 
> In order to restore the previous behaviour, change the error check in
> the set_fan_speed() function to ignore the -ENOSYS error code.
> 
> Cc: stable@vger.kernel.org
> Fixes: 0d01110e6356 ("hwmon: (gpio-fan) Add regulator support")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>

Applied.

Thanks,
Guenter
