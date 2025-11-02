Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FFF35975
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Nov 2025 19:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762110263; cv=none; b=QrOVttkbGVxzkgrEpXWu75AGxgQUX6Rp/VfK9W2X28GrjxG/MsUnB4nXuiVoGoEu1NnUcfoBcWW+gfvGPrr4tl7AR3q19l7gy5i/1dQflH2p2SknWMWdqswOGIs95J93Cw8A5adNwfcAAui75RT6MPPIcUsYFUJTVHkw/YgtrGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762110263; c=relaxed/simple;
	bh=dOs4gbMporl3UZegOSJ19pjsXgAASYDpHErFCO/+SmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9CXIi7MrS+0c44h35wM7rKkGAsQcwT0Q9Nb+5ZIbmya8qZlNLpWpoDbCu/3MBZIIO+eI8eLIpkD1u3kAPYfY692D1oa3cNxMwEksGpoTfdKIOzUAZb/5tLOQk32+hPrpW1I6U0IRbqGXgV9dgmLXIZ2DaS1tnduh16SiB1V1nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTgFnqAn; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTgFnqAn"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b6ce696c18bso3377588a12.1
        for <linux-hwmon@vger.kernel.org>; Sun, 02 Nov 2025 11:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762110260; x=1762715060; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1bEBvdKdcxlFX6ebzJy0mu/otoDYrSmrnQYrDh7FFC4=;
        b=HTgFnqAncVjVs6lSmEALM1+/VUzNFbxXQfdjfbVPq6JsQWxDFBPPWUj4f08MnQe7vt
         5aQUVjDGohvPIIra4fhdKlPd+iFvyD+AmBVopIliShP9tmw+07LCo8eCWhON/AlfBSde
         GTHLpOPqToHQEuHfrSPuAPPBCVr68yMOdVPhStEpWAsmnrOJ4DwSLhBW1/aSJl1EF8lB
         0KJ09NUWZuisv69mbYsWSG0mI6W77mJYRcP/t1mSo6NFba6v/am8PpJ+AdY5ToJNUP7C
         2bWHofTULE//fKgdyxHLjYZO5e8c5IMvInYjXx+IKbUWsa5KkcX54wyLc3ZCgNsv+Gan
         c+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762110260; x=1762715060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1bEBvdKdcxlFX6ebzJy0mu/otoDYrSmrnQYrDh7FFC4=;
        b=gErK7n3Wlf4MGPXoaDYcPJfSdrVLRQt7gm9kv9rJwC3lm/T1QbWDvlwZkJ4MyzZ9VB
         J0116Hpc+HqXYNhJpGh3gNIGxSy71vQ5hVAMTjUmiz6vuaRu9AHVmrE+qR/RkhbsX2TK
         afxZZu+11ah89uOIFF3uejy/qrJ2tNwdlW5NV0PFFodAqx7cQ+pjjOPh53r7TgVP7675
         p4Wsp9M9DK2+/xVAShhL8JC5NUNVF/T+OLPoZRyNkqapffS7ht9MSk55tIEjym6/HMcL
         Z3tbVbIUkuZcjWXohm+GNNH87CBh0slOFlhx1dr3tLjVmNFZSIvLNDhzCPnMvcYjRWAv
         8WKw==
X-Forwarded-Encrypted: i=1; AJvYcCUHl6krfc4fSR4alvFZ4uB+k6uPKBNpX0xtqlz42qWPU5om4f6cCy4zXJQcushzFxIpAURLEH/0GK+MMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEtJtD38dQ4pJoHTSl6Ruqu6cLZ61Yuys4W+yprCBHiLINJQc1
	8N4Ox1YoeJKvOvw8cB/upsSnreB+3CuygtZvRf2RF4NZXxwyft2YjdO3
X-Gm-Gg: ASbGnctqOHHGE1cxnWgGkbriiEoWOQUlnLCofpaEmEsGAa3ViCVgiPGbjCA6kLsWzwa
	nY98EUeYGH3g20n9SXxFVhbOpFco+ZLiIuEaWJ/H256hs1u0g+6EukxtbLnfxnCYFyMx57vijC/
	EJN4Dml09c0ujiiTqp/xy8SK2X5jELcWiaWPqSsh7gVTD12IqBB/5I+dkLFPZzGg58xdbImnRzF
	3lspLa0jTJZ80MuuuQYR3p5urjYACFKYjWaihgZhJsKzIC48WBWD/0WN5/Qj1a3GPniILAk3xQ2
	T33TLT9Krx1sDl+8CKm24aoYMev6mGXOLkM4i9Kt5zmYe9w8Kl+pHsuvR7EqbhYJyVPWP6oEVpw
	jAkmxKR101MgyddxkaClWrvPyTuSaL0IIOKDi54sZKFm4f4JcFG7U3HzXq/YMHfm4/FF2iqk3W/
	wsUvliWnnAMhUxOdrg6VrDI4M=
X-Google-Smtp-Source: AGHT+IHBepnSh/nJMIs+AM56HkBo2+XztwsCngVj9gWh9ekQI9mRoHgowgr7zRoiZ6RUf6OT40Hilw==
X-Received: by 2002:a05:6a21:99aa:b0:2e5:655c:7f93 with SMTP id adf61e73a8af0-348cbeaae49mr13919906637.33.1762110260311;
        Sun, 02 Nov 2025 11:04:20 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b99801b0e6csm2864275a12.24.2025.11.02.11.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 11:04:19 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 2 Nov 2025 11:04:18 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX X870-F GAMING WIFI
Message-ID: <daa6640b-9044-4586-a981-13eea7fbcd3e@roeck-us.net>
References: <20251102114038.283396-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251102114038.283396-1-eugene.shalygin@gmail.com>

On Sun, Nov 02, 2025 at 12:40:28PM +0100, Eugene Shalygin wrote:
> Add support for the ROG STRIX X870-F GAMING WIFI board.
> Testing done by the board owner [1].
> 
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
