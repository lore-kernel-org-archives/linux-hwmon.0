Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0381C2BE7DC
	for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2026 20:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774902079; cv=none; b=AJXnvRtUp3F1pfxJJkNr+YqCbj7buMt5x1GqPDwlyM4vMNnVF5Ir9NYSPdp1Y0x92JOVes8X0Q1YPenMbd71kVeXWAwpp2s8LD5rdYNE12hDh7D2uffnPfiUdSa+uqX6wjG67tPg8ATQfx7Y5KXWIzQs2AsMfM+O/6sUbuswYho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774902079; c=relaxed/simple;
	bh=KNdH9jfeaOOFlpTu7G90oWexxiY3M4YjurkZNCsIjMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fqy0PpoljmZHSI1LvxT97w4Tt3xASeIpANYXIc3wZDr1TjkZPT9hUUTPWDGnwD0HjbnpnSQU5XHgW07nzPY+UWpGF5K2X+N/fL4WT8u0lHmdb7Lhuz4B5ErZUFT1I0zsNbZeVHc2MLQe7ZvYvBZ/RNObbneyh0i/e4oe0mOlOyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IBiv6Bhq; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IBiv6Bhq"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2c7e5f38b37so174805eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2026 13:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774902077; x=1775506877; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOukF9SDFQnuJqoAphZ1SypmYNAJ+5RMsItbeGF3neg=;
        b=IBiv6BhqoTLTWc+5SmGphs4tePK5eWElbZ/ylQmmHpe0enN/zKQwM5coUODYKz/SZK
         BfqB5QiNOOauQ8EGOrNzFh7/y1ivBeh9oXWRGWtxr6puv6PJqlEBpJkQrAmsMIDSyy3P
         QoZCv+sl6T9GByfu6ITSKSeFo94zzCkLsgjVe14gRDvmJuWrbRqeKtk1C9fXydENibLx
         j+dqe2ANqxUslr4GxYwMZanfvvlxWP2JCZmZSi3oiSQm6Hoi7K+LZtK67s/j138PqxOY
         GcWMIsiSip7zg585L07bVKoEZgqznd3VUTnuALatx2d4w3zGOAnGyZJyNTIE/Tzv+e6L
         lBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774902077; x=1775506877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hOukF9SDFQnuJqoAphZ1SypmYNAJ+5RMsItbeGF3neg=;
        b=QsCDbhR/LURXwL3llyGdnd0mNnj+QIDBh8mgxeJNjrOdsWWmrccn9Kp0gKv93YhK5N
         EvEmUsYslQ5mgIP8kN/G8kbbPhVkqMDqoQn0mq51dzd0ub7GHLIhKPFrizXSnNJKBYHf
         nQyCSqhFH2HUYL/zp9Ml4BO82/CdEjRNibWF0zncSBWq+hBvQQtzXosMj/j/NgztkL0K
         6jAqDRjZ3IytIlmDrTeixhbCeGcHkVioo14cYj+8yPhHpDPhZyeSBoYW9YjgsCCrKr/m
         sNu7ZX5mZ9e69wK+9pLbRNb/AV/iuiISORF3IgJRhE62juxyIiIiVKsaO7d7YWM7bsgO
         jeHg==
X-Gm-Message-State: AOJu0Yy+bMnZvkO0PUX+TDIVk3yW5DkXHzw5H2IlJ9xkieDhjW5rtM+g
	s8LABz5J0QqcZmvDawX2weNpoE1rHolc8wbn9fzu71wBWdAqLX0IoHBP
X-Gm-Gg: ATEYQzxoGclRSFwP+G6am5HWXvxJ86eUGTxDKJMz9hV+OhGMzSPWkEyz2iHlCCV7biq
	4J4ANGwbbuLfmYzpZDzvKIGE0HNs7GevJP9XBiDaBgM74lkJu59NiCGR2QUs+fHjou/veJVs9f+
	UFRb+8Kc+KrH1pqm85saGwPM/aZQwf7B6Z0IIErjDNpeq8jsM7YJ46aUpDwhQCVjGEYl9TOjbiW
	2Cbu6Xd4/Qq44NGv2a81ijcQwFdyk18yq/dkC5ISkcaj30OPn7tge6O+i/8UCoFjr4bwL2evBt4
	cdT5LBJt5GgH0yEcTVNUoxKY9yLteUQHkuU1yQWpQvfW+VvXA73olxRmFSmIl50ZC6LFrdzoTic
	1+wmITEP65eHsm5kmbu9qnWaaWvPq9KuiSHF/P7Hb2j+B6ESDOeeSGlvkx3mXQ7B44fMG2S9FEn
	qEJ6dIunW00ISQvQgIZI46/f/iZaPmi8CHGfzL
X-Received: by 2002:a05:7300:6426:b0:2c7:31b2:44ad with SMTP id 5a478bee46e88-2c731b24c6dmr1699038eec.31.1774902076911;
        Mon, 30 Mar 2026 13:21:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c68b272esm7877309eec.15.2026.03.30.13.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 13:21:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 30 Mar 2026 13:21:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH 1/3] hwmon: (occ) Fix division by zero in
 occ_show_power_1()
Message-ID: <49542ce4-7ce4-4476-8567-7717e862ae63@roeck-us.net>
References: <20260326224510.294619-1-sanman.pradhan@hpe.com>
 <20260326224510.294619-2-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326224510.294619-2-sanman.pradhan@hpe.com>

On Thu, Mar 26, 2026 at 10:45:23PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> In occ_show_power_1() case 1, the accumulator is divided by
> update_tag without checking for zero. If no samples have been
> collected yet (e.g. during early boot when the sensor block is
> included but hasn't been updated), update_tag is zero, causing
> a kernel divide-by-zero crash.
> 
> The 2019 fix in commit 211186cae14d ("hwmon: (occ) Fix division by
> zero issue") only addressed occ_get_powr_avg() used by
> occ_show_power_2() and occ_show_power_a0(). This separate code
> path in occ_show_power_1() was missed.
> 
> Fix this by reusing the existing occ_get_powr_avg() helper, which
> already handles the zero-sample case and uses mul_u64_u32_div()
> to multiply before dividing for better precision. Move the helper
> above occ_show_power_1() so it is visible at the call site.
> 
> Fixes: c10e753d43eb ("hwmon (occ): Add sensor types and versions")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
