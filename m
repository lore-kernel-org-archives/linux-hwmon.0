Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C060D1C860C
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 04:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773809340; cv=none; b=kdbQLI2mLUftazt/3l/fWw+y5l0EkoxIhh3zSI95XvpGWsUOdJPYpel7XAIBIS4FM2tVXYRATRSJ57vSZCaOtqE17JrD+v6WnfiNOuOuWXJMZCPMu/08o49ueKgjGwxVpGhj4I7tk/bCgjS6iMsDkVkWua9qYsY11BoOCUDoriM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773809340; c=relaxed/simple;
	bh=17iPzKkUJzPn4E61UcR7m/teEZK5kJ3beqSFLOUuoD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rru+Aj/1vId7Y0w7AFbTBW8X16Ey+Y3xlCwEOfA/a4U7ydCJTkKupJla03XGTaSVci/aggaX+tjV7jRWq4frJWo7xAG/Z2T1uGtBZLDRXz/d5TGPi/w8l+A2rqteq4RT1S5g4roIPxvbdrBKrofIQxmTnCbaRS4rEAD7JrmNmfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EEETt0hu; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEETt0hu"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c0d36f3888so2436691eec.0
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 21:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773809338; x=1774414138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ejLjWRAwoEU5o80iQ+QQ21HclzxMPuHPja9YvmCRZw=;
        b=EEETt0huR+WR1z3OUWA2WqupaidOBI/4vf+bNW4OsgxgIChImYMLJhVKUBg6JVLqVl
         CU/NB3qhdLFt5bqYfjSeg1kKfgkXhbauXbsF3QF1MGJycX0EPUBYlp7rfcAHgYjngcD+
         A6912ib5mRN5+zndexEix63FZrxpuflz0+W2xLdWNuOE5hGwXwRh+A+w/3Ml7E6LIRWG
         NDdeQ9rrfttyzhltN8mKi32LrVAYRydHj8l8CXFo2ymyVBAP04VYBw5qw1oY5xnoXmll
         nTMfg+aHEhtXz0VAhJXEIlaZClM0G2/f0GVjFgFHIYT8KgqsJDJNMNtyaQEA3j0QBFS7
         LWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773809338; x=1774414138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/ejLjWRAwoEU5o80iQ+QQ21HclzxMPuHPja9YvmCRZw=;
        b=rgLoRFyTrMEzKv3z7tr+JXrYHh5AEpOce55iR6y4vHclDrgoMpR1ZDtgti8SJbvgJE
         R8BBdZBNhdAq8U0b4700nyp1uyuAmPQL8VSwr/tievy3PmJPW1rxLo8lcgLMYtbpP91I
         u+zfGQF4COMlrj7YieH/iVlVROPJ98U5wxDEEnXmmPKMDvZX+osGwwbR3AlCqGsVrywv
         ubpz3ozvyzjbRyOTsCXGdQkApyOl+eN2JbjfUijVqJm/qKs/TEcbVuAUFatabDbM4jRB
         JTOGteSUn+9obsq0MqWQ69VZHyubB9s0MmXo7LL9damEXkY6O7LrhyxWdoPK1z/u4l2s
         c41Q==
X-Gm-Message-State: AOJu0YyAPAxuPMEzaxNi+Vtxwm3+A+Q44kndugLPpyawnNXsssmFNvha
	ZOU58n6MdgIoTv3WEtX6/w3ibTZzTuNKz2ykYGJMVAbj8efzetlzEAI/
X-Gm-Gg: ATEYQzz4h4j/M3paLuifOKAvr8I3p111z/+WfKzC7AFQEz6o2tVnJE4it7lq9INHmRM
	xMjXAVGENS7f67WnVbA90ELlDF+UV0yHvuDhUfcAtZWRTsGZMQRb/Xn1ppxsqJBMBKpNRyxTsk2
	d9wp0eeUCJoOLWQe6ZgvGhJ7bwY1AnBmd1gyDwl5Ksvc/kJwauM8b3gGkIE7B1OSf77FEu5tFov
	Pr1391K0bxOlzm+NgIKXemC5hBPJN6V04XuYamX3nEPvTlSOC8R2NcoR0OQarmZEhkEfZ+K9VaE
	x8V4Z5KtrEkt6ZCE2koxAdDkPn2gmjhvyGScvOCl0uiVZ1ODakjQ6SMqa42jU0HsLakW8tIkhZJ
	Mg0LgdfM7g0JMVcBUkP+eDzbboZRh8PLA7eAjGJen9umY951gytNRWeMI/CNB4y/gjpwK0rS8tv
	HJrd3xlh1w+Pyyi6vrpN1edSQcAd5Y4N7GnIlz
X-Received: by 2002:a05:7300:320b:b0:2be:171c:5048 with SMTP id 5a478bee46e88-2c0e5074af8mr957700eec.5.1773809337736;
        Tue, 17 Mar 2026 21:48:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e560fb5fsm2902735eec.31.2026.03.17.21.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 21:48:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 17 Mar 2026 21:48:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Dawei Liu <dawei.liu.jy@renesas.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, grant.peltier.jg@renesas.com,
	linda.xin.jg@renesas.com, tabreztalks@gmail.com
Subject: Re: [PATCH v2 1/3] hwmon: (pmbus/isl68137) Remove unused enum chips
Message-ID: <2f1347a9-4284-463e-8ca4-abaced830468@roeck-us.net>
References: <20260316053541.3903-1-dawei.liu.jy@renesas.com>
 <20260318021921.75-1-dawei.liu.jy@renesas.com>
 <20260318021921.75-2-dawei.liu.jy@renesas.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318021921.75-2-dawei.liu.jy@renesas.com>

On Wed, Mar 18, 2026 at 10:19:19AM +0800, Dawei Liu wrote:
> The enum chips is not used anywhere in the driver. Device matching
> relies on the variants enum instead. Remove it to clean up the code.
> 
> Signed-off-by: Dawei Liu <dawei.liu.jy@renesas.com>

Applied.

Thanks,
Guenter
