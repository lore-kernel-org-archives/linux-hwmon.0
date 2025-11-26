Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9B3304BA4
	for <linux-hwmon@vger.kernel.org>; Wed, 26 Nov 2025 15:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764172228; cv=none; b=MfYg2cMAMA60T7UpJn8aVjs/juuedTp8d0ETVxKGox3wCNosRA/j1NBEZr9C1/8/kgE/6gMYZzE3mU2wPMZd8HVgNTar1BAL1QWj9aETuq+/fUghw8saNWvZ4sBwBtJ4DG6hIS7asd1xG9BVEb82EqURYotaAEs6oWJ03ZIpmTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764172228; c=relaxed/simple;
	bh=9ImGhb5VHt1sIj+S8p/sCzuADJWKOAmfx1RdAACn3u0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JuQtQLZd2KtsCODW4h/Qf0H3yQFS/uQ3PABwKlBTlRUt55l4BtSzxm21UxCJfrgNcWqErhZfKMxuUK26b+Q/wvCmRyvpWDTxkaNNtM262GKSqpFDCxSljtiKGbaR8Ng9Grqi8ennU9/WdjKclCo9Raw0roe7qaUEqIYgLWb1B3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTFT6oTM; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTFT6oTM"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7b9387df58cso10857720b3a.3
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Nov 2025 07:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764172227; x=1764777027; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GxkPMvTHFLTjPIqR0uHTN/Ir0NTjVcTTJJUdlvMyaCk=;
        b=NTFT6oTMg4erFs+SLfwYpViopp1vLHuMR1IznbKv4Csw3HPijiJHBgenVJFVeT7+/z
         TPWk0C+hITTUefGQSpUG1AwnP1istigGkRwuQRjuzlHMp7wUE0Bl6mSa5sWU9Nuw8ESW
         eFZblZu9rTDomIs/d/EKLEdYVTOtnG1z4pZf7pUpRsHefty8VYd2r9YzOIz6NjNoOBAo
         8O8yGDgijP/TDQLAulPWkR6R4U7aZ4EEiR0ju6gt51bgyEzJu8+T95IElTu3pEZVZUNY
         yyeGpp5Q3/tzMxp6Am6/nai1k2I1NDlbJDp1V+NiajBs8+jRNkzN86U2GOweMJSt4RwZ
         S4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764172227; x=1764777027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GxkPMvTHFLTjPIqR0uHTN/Ir0NTjVcTTJJUdlvMyaCk=;
        b=tgkoYb5VEPKEfEtYEFiHfTFIwvAkkF9MUv1iDlOw8TneEKW3IFmnouhgfz0LCFluof
         6I6RBrAsnz8TGfQuKK65Bbn5ppc7ApdY1V9Ig6MbI6esCUA2hZVf1X40zuCrOjVyjutz
         A7yqRh7G8ng0Nr3XdBRZQGfpEP9wkb9DYApH8Oba/P2W9lbolZeyR2DopXpePTCRYJs2
         OJudq4LMEXg8xkkTfUcHr6F2RjZxY8tIzR5eHSNvKrkcY2nHJ1l1dZdw5tjd045iXPVT
         DTzkeSlUr5oxnjnv3uPgWTej2Hm6Q4pbfuLJH8A9aZ1EtDPlU3u1LtJxOK9xxjYs0iS6
         V1KA==
X-Gm-Message-State: AOJu0YxlzydoQ7Z8D+8tpvLqa7wNobkldmcqTMhX4zEi96bkSq6F+Fe5
	m6Oiyrp7BjxVE0r9CZUOv73iuhusncIF3Xh1AGqbPd7B1wi7jemI7J1D
X-Gm-Gg: ASbGncu5YodiERN1KBYSDOBh0HP2AR7SKCA2wFE9ajzTuuZiFi4jTj9Bmxei65ZXQtL
	QHio5ZzWk0tHmUzvjpES5sE70bjWiYHST6Ft2bXMtvpcAEzmEULMe4lJi3pkTqrapADXjaNOUxW
	FK7i1TgSJOnbi+TixSwV11J/CehBYF4O0alZUwtCB6g3HS8A5iBTqmFkbfalmpT4l6Ke7VReLDQ
	kGjkS6M/DMcPv2VvJNcrSv/IICda3txJ5eK+nMVHgdWkqNb17gTFmyXLVSvhaOnhAy3+0ZjwP6V
	czYaxAB96lXxWxHji6P9x/OiP6LGBfaUNTR9DIFzKXhWD3YhsNUN0a5twP6tD1UW/68fmKd/uTI
	vWi1qUIAYhxrl/RA3B8wMO6q3jPtz8qL6elIg9X0dNIcn/cq45VEdRsD4HQ+RhCOU5hsEOiJq4o
	aPqYWYzPVXJd/Ls2Iy7CynkZ8=
X-Google-Smtp-Source: AGHT+IGDhs/kW4iLt6avNYehelW/X0dOFNyYZ72SfUYKOQgKfv0azL+u8SE4o1oXVfKIgTHwbD9GRg==
X-Received: by 2002:a05:7022:7e05:b0:119:e56b:c75b with SMTP id a92af1059eb24-11cbba4a4edmr4972752c88.32.1764172226741;
        Wed, 26 Nov 2025 07:50:26 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11cc631c236sm26594012c88.7.2025.11.26.07.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 07:50:26 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 26 Nov 2025 07:50:25 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (adm1026) Convert macros to functions to avoid
 TOCTOU
Message-ID: <6846be0e-2711-4da6-82ab-6b348c15edc5@roeck-us.net>
References: <20251126113828.10003-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126113828.10003-1-hanguidong02@gmail.com>

On Wed, Nov 26, 2025 at 07:38:28PM +0800, Gui-Dong Han wrote:
> The macro FAN_FROM_REG evaluates its arguments multiple times. When used
> in lockless contexts involving shared driver data, this causes
> Time-of-Check to Time-of-Use (TOCTOU) race conditions.
> 
> Convert the macro to a static function. This guarantees that arguments
> are evaluated only once (pass-by-value), preventing the race
> conditions.
> 
> Adhere to the principle of minimal changes by only converting macros
> that evaluate arguments multiple times and are used in lockless
> contexts.
> 
> Link: https://lore.kernel.org/all/CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com/
> Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>

Applied.

Thanks,
Guenter
