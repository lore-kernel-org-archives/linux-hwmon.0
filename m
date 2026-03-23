Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991641EDA0F
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2026 01:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774230021; cv=none; b=kAibPoB2WWkzFbFHosmaHknzrnl2xGM2TTaWaA5ohzDiPodem1YJRbk0ZIb0jC9Hclox1X22WUZGxDP7CZ8PA8y95ByeEW/ufX7J5IKJ7IlIpu/9o9SA+YEo+WPvBCAvEyLDfqjoXoOSNV2JnX4e1+zRUDCA1t6LMWNwiRqM2Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774230021; c=relaxed/simple;
	bh=x+NQTNG7TLJbf1+gAkp809JyPlVQTm3JsLRUYPdDhxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBLQ7lEFV6BDOBMj9ks3o9xbXYb9btepxfB4r7Ag8Xf7lT6VMTAG8UU+rCKE/Hk9IHZ2eJ4qlG7LRmyKV0DMZV7IzLmiog11xH8nsy6lrcazjvmNsM2c1UqII9fTOBnO6I0fmIv07e7DVljECjFMX3Q8V9kkhmMTgcpXWyPY+K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Amorlrcv; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Amorlrcv"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ab46931cf1so39009345ad.0
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 18:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774230020; x=1774834820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lK2HLOWAGj+69lEc/65okI9MbvVHw7Gm/K5aPIjtCA=;
        b=AmorlrcvRkClBJQ/8FxkBsNIs2XlO1cYiJtw3C+VbJ1hK3M1hFO0t31QFRnzrzje3c
         z5l6nLLaf4GU27dmnipepDyRkt1kl5XScLAKMM+mUxHIbIbMhTgjBKBeCSs0PqRBy7lx
         haQc/hcr//sgEMxsFiO+1KNeuTWpgLwvQp7eQClO92V2EAg52FSTxsSzLLL3KEyVPzDY
         tjtdockQL+P5TJltums+I1Ajs9KQ9+1BJfl9vvdZvc5WRLU3E9i1RfFLHpi+Xk+F8vsQ
         XnrkluzFzgPZfIvyI9m9ML0O+VVpHSG8iMnk6+mVF1tyGK3DHCyvUtOOvuagEqUK4m4t
         +xDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774230020; x=1774834820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3lK2HLOWAGj+69lEc/65okI9MbvVHw7Gm/K5aPIjtCA=;
        b=PAMD4dd6lejuV+fju8RfeG2vxiuTaV1Qo5HEdOW6/Qd8yrIUjnuWZJATrNwgyd7W/r
         0Z+AduQBKNeryLjk01EuVnWbrvwZEbCG6tF6LS9bCPJM7mr0EExcyuDfC0NDstsEcVq5
         g/7wWPoE0d1ieLbJP6fksrlA/JdsqPfhKsOId+9yWbGRuEb05REOz8F41yBHMkDkOyPc
         yhwN3v5YnbBra+ygDZTHxLajn+GNkiwesJCyBkmaGfzsLre0zoWqZ1dEHBEOmngYkT1h
         OmbEkBKzWOSDFiGDIAgXzpn2vKJDJkZsST7Sy94JQW6SZf34yJ8pF/nM4I6Kg+IjA98K
         6GjA==
X-Gm-Message-State: AOJu0YwgpQK7YaKmzluA8KmILG2CQ6B/vKdmFiNNn1FCBx0rbyGpVg5X
	Z7cu8aCOj1jOGEBvf51BBE7MZ8C3fGIarHXaAl8dan07mrmcECdjq28F
X-Gm-Gg: ATEYQzxx3B+dXyJ7wok70GhwwkEnwjsLxOsz267L4hJBGSU4wivd4NhjhRKI3KjZppx
	ttrd6AcD5VULDoH3r6siQzSdsbp+oaGCATGU7sVmSoB61LJff5v4Ar8R++4mP2xq13xIlbUnnxA
	3xYLltoAMSiKlGRsV2D4q61evdsipw7XaQt0A8BFPn9uZJbhlODh5ZozPMpcPZMzeK9a4Iq/AJh
	gDE6yzx3hfPbeyHT+MwrQ+ZOHzKlzCPsZVnNmu7IDmzd+qTkc1c/ClPmg+5xApMGFAE0THwqlPj
	6giHI+1Bm/abpt003+NRD5pgZB6N0rUUcMNujB1velZJjcgzW87SLTiTKpE4y1bibBcCJCRqUjK
	Snh35w4FcwemMP657RCmeQnCPfgWetBUYVRW7BrsH67+Dt9GLv3sR02N44FkHcT3oAArCxvmAJs
	wxAqmqhvcCLGc9mTNBejUg2zMEofcC0blNPSpK
X-Received: by 2002:a17:903:94c:b0:2b0:5ac2:9aa5 with SMTP id d9443c01a7336-2b0771eddb7mr117594055ad.19.1774230019940;
        Sun, 22 Mar 2026 18:40:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08354b109sm115638305ad.31.2026.03.22.18.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:40:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 22 Mar 2026 18:40:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"iwona.winiarska@intel.com" <iwona.winiarska@intel.com>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH 1/2] hwmon: (peci/cputemp) Fix crit_hyst returning delta
 instead of absolute temperature
Message-ID: <5f7d51e7-0f63-4f06-be4a-faa168773c66@roeck-us.net>
References: <20260323002352.93417-1-sanman.pradhan@hpe.com>
 <20260323002352.93417-2-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323002352.93417-2-sanman.pradhan@hpe.com>

On Mon, Mar 23, 2026 at 12:24:25AM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> The hwmon sysfs ABI expects tempN_crit_hyst to report the temperature at
> which the critical condition clears, not the hysteresis delta from the
> critical limit.
> 
> The peci cputemp driver currently returns tjmax - tcontrol for
> crit_hyst_type, which is the hysteresis margin rather than the
> corresponding absolute temperature.
> 
> Return tcontrol directly, and update the documentation accordingly.
> 
> Fixes: bf3608f338e9 ("hwmon: peci: Add cputemp driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter

> ---
>  Documentation/hwmon/peci-cputemp.rst | 10 ++++++----
>  drivers/hwmon/peci/cputemp.c         |  2 +-
>  2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/hwmon/peci-cputemp.rst b/Documentation/hwmon/peci-cputemp.rst
> index fe0422248dc5e..266b62a46f49c 100644
> --- a/Documentation/hwmon/peci-cputemp.rst
> +++ b/Documentation/hwmon/peci-cputemp.rst
> @@ -51,8 +51,9 @@ temp1_max		Provides thermal control temperature of the CPU package
>  temp1_crit		Provides shutdown temperature of the CPU package which
>  			is also known as the maximum processor junction
>  			temperature, Tjmax or Tprochot.
> -temp1_crit_hyst		Provides the hysteresis value from Tcontrol to Tjmax of
> -			the CPU package.
> +temp1_crit_hyst		Provides the hysteresis temperature of the CPU
> +			package. Returns Tcontrol, the temperature at which
> +			the critical condition clears.
>  
>  temp2_label		"DTS"
>  temp2_input		Provides current temperature of the CPU package scaled
> @@ -62,8 +63,9 @@ temp2_max		Provides thermal control temperature of the CPU package
>  temp2_crit		Provides shutdown temperature of the CPU package which
>  			is also known as the maximum processor junction
>  			temperature, Tjmax or Tprochot.
> -temp2_crit_hyst		Provides the hysteresis value from Tcontrol to Tjmax of
> -			the CPU package.
> +temp2_crit_hyst		Provides the hysteresis temperature of the CPU
> +			package. Returns Tcontrol, the temperature at which
> +			the critical condition clears.
>  
>  temp3_label		"Tcontrol"
>  temp3_input		Provides current Tcontrol temperature of the CPU
> diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
> index b2fc936851e14..badec53ff4461 100644
> --- a/drivers/hwmon/peci/cputemp.c
> +++ b/drivers/hwmon/peci/cputemp.c
> @@ -131,7 +131,7 @@ static int get_temp_target(struct peci_cputemp *priv, enum peci_temp_target_type
>  		*val = priv->temp.target.tjmax;
>  		break;
>  	case crit_hyst_type:
> -		*val = priv->temp.target.tjmax - priv->temp.target.tcontrol;
> +		*val = priv->temp.target.tcontrol;
>  		break;
>  	default:
>  		ret = -EOPNOTSUPP;
