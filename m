Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389B51E520
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Aug 2024 15:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724771341; cv=none; b=lhJDW4S2tQjOQi3/kstycjaxTH1aQsDGhUDrguQElha+EdeA6taYjWCFRg+h02TSvNU9CO/6oQ8IQiITB2IVudjCTYVA+bxFQWpzl3rw0KZIzsYtGFSEq0SDJAmvQ35rFMcdNwv4hFOkBxrHk3SMiPY7yUSpaRSxHlpwvaPYwJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724771341; c=relaxed/simple;
	bh=l7WxW36O7am6p3vv+/0BRCw81cJKOj86v0+TCt1c754=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HrUTxo4psXFEiXnPYfdJ7G0ooIRqj9lkuA5QjhBGu+TC0NzdJk0Pj7z7VXbp678JD/W81d+2PpbQ+3cUPs6cBXnAaJtzJo4bKzLdgU7FJS/+Odx0/Z4Jm08n9EZl2LHJVxPlQjQU9D03dq8NfUEHe90HyWiltLSNbJPjtql9joI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tb2QBC46; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tb2QBC46"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71430e7eaf8so4451128b3a.1
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Aug 2024 08:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724771338; x=1725376138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3n0Ph4/cZee5xGStGup0GbqMBI9F2UvrvpLrg1CT1eE=;
        b=Tb2QBC46uCUkMO/r6oXgjGnoY13BOu6wvHlroO1qEk5w8iAqytXNaFdEO7nSCtYO2d
         O1J6HpflHUuMrmAJWzSMWDEiUq8HjsKH9/IrUhpkDokmbG8TIQsQIJT2+x6X2jYU2f/H
         X8EHZGkib4SsHr6JqXQMUgLsi0Nvof+6DhyO14KAZ39kZ6gGOjERKWLmcAoXOBUqKy3N
         aHr805WBPgPvmg7cZvlnaVVTFa4xRiK6ptXoEDid/5+ZJEzDxCm3tsEWTEwhak3BGwPX
         wCsqgVlDaZHpc0j7hguHaEdUMH5e1B+VlQHo/Jw/yrb50F+DTY1zt520l7/nA4WAwlMF
         0gPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724771338; x=1725376138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3n0Ph4/cZee5xGStGup0GbqMBI9F2UvrvpLrg1CT1eE=;
        b=VqFIUAJoz9pFuJ7HyEsXtO6PZFukPuMbldY70KJuhuNvAAHCKmZtxiVj4vmYQK8K+V
         ztrm+8mKqnN46UShdo5Bl8Bj9nm4t1SENHSmq4auF2kfKWJQE4BxphlAflWMpdvhY5X2
         3wneQKcAtIx9ic7Z0J/fz+zSy9imSahFLA3vXnl6VDSUeiVH+zG2R4zYRtyK2OxE7Lom
         6zC3yoEnBkSO40A339TiKIEDmGmejsy4x8MmvV/G4/I5mZsyR6Nj8OIaD/G4tN/JeLPs
         XwjJduwKWRUhisKRkf0zs3RRr3C8yGiczbSMeCyZmq3GUwLQbPstXkEcDfaOiNh0ScvU
         quhw==
X-Gm-Message-State: AOJu0YzYiu8nzlNyjCeSnwcFhM1VhKIsbZumq7jkqysVXvls6rSBLZi9
	oZR7fdK+Mot6M2pGrIDM94RAXkXRIKPgJGwuTeKyJEbBI1koaguSyoU7fw==
X-Google-Smtp-Source: AGHT+IH0IFkRvC4y2nD/QqdJdvNsjDJ5QEzApgy5pZnO6TcskmAmCf/Lnja92KlDzHomaaLyjSKetQ==
X-Received: by 2002:a05:6a20:4f89:b0:1cc:bb4e:a905 with SMTP id adf61e73a8af0-1ccbb4ea95amr3822894637.1.1724771338243;
        Tue, 27 Aug 2024 08:08:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434230d1dsm8681882b3a.37.2024.08.27.08.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 08:08:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 27 Aug 2024 08:08:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: mailinglist1@johanneskirchmair.de
Cc: linux-hwmon@vger.kernel.org, groeck7@gmail.com,
	johannes.kirchmair@skidata.com
Subject: Re: [PATCH v3] hwmon: pwmfan: do not force disable pwm controller
Message-ID: <e6ad0833-9af3-438a-995b-b8c15f49b3e7@roeck-us.net>
References: <20240827054454.521494-1-mailinglist1@johanneskirchmair.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827054454.521494-1-mailinglist1@johanneskirchmair.de>

On Tue, Aug 27, 2024 at 07:44:54AM +0200, mailinglist1@johanneskirchmair.de wrote:
> From: Johannes Kirchmair <johannes.kirchmair@skidata.com>
> 
> The pwm1_enable attribute of the pwmfan driver influences the mode of
> operation, especially in case of a requested pwm1 duty cycle of zero.
> Especially setting pwm1_enable to two, should keep the pwm controller
> enabled even if the duty cycle is set to zero [1].
> 
> This is not the case at the moment, as the pwm controller is disabled
> always if pwm1 is set to zero.
> 
> This commit tries to fix this behavior.
> 
> [1] https://docs.kernel.org/hwmon/pwm-fan.html
> 
> Signed-off-by: Johannes Kirchmair <johannes.kirchmair@skidata.com>

Applied.

Thanks,
Guenter
