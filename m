Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442F11DED4C
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2026 02:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786415817; cv=none; b=d+xnj6ZzFmpJoXuEjqhLc/+8V0FDab8T7KO0r8PEz1ejOvgsqAfj+cqMax+FkUCnDTSaan/FjRALVXl1SRv30lUUjpXGg2RrHxZo98xYjHzC/P3FToygGKyzVZ4Me0kP6bOzKUjorj7EJKaiy5yUl57TwkV0WF46DoZ4Gm3NSVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786415817; c=relaxed/simple;
	bh=hBIEglLIVgvkp0LZjbdv7RfNDjmwebOXNBWEbKgUQlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=slV6n1inJkzV4Pfa5z9GpfWJRzIfUOA9DTn9eT22664T15aKQZuf6WESQGuSNyuvR36vM2kG4CntTHFJ7O6Y78FIcPF4CsaJArX143pXBn4fYAhb5SUTCmPoKFQzDkOAgo2o1JwV5Oi0ko0dRekJM0A2fdTeQOGWu9wAAGrhoC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q/AUN7So; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q/AUN7So"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ce7d2adef4so34326605ad.3
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Aug 2026 19:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786415815; x=1787020615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Oel8sJNOR+nLSnGmWFFSdgR5wwghGytonh009t1AV6w=;
        b=q/AUN7SowCkGu9UQAVC1JUnXmDS1u2NEx97e37PPsK63rZ/IAqnqacL5/GotOpydus
         dOUh7AUpnIc3GKQRpfaa2RqCRaPCBMxyDLTT8cJqffWA6yudq8d5BMnjLGT4OfIhFjQp
         BbEvG7UqTVXFhcl4GEaNNzTauz+zoTqEO+YssZfVhzrCfBjIs2oy2CxSVflOqQhABXns
         3GzDS+8VO4Lval0WfM0lwNRPUr5bUqLA7aImOQhMtss/4roIdn+qPHBtaM/A8evYfeRR
         N5KmGScuFv1v8BWz9tm4XyE4XQh9/5Nba+baVJ7EnePvOiELa6maAbbiiy1Uz4S1Ld2v
         cRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786415815; x=1787020615;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oel8sJNOR+nLSnGmWFFSdgR5wwghGytonh009t1AV6w=;
        b=EtVknE8sIzyENqdRk7b2K71OjmDIcgpYWplTo7kB9h0vcoivEw0SN22HV7cxZ6yuJc
         G7lSPenDStvzHlWwJxFXFJWhtiQH9JNuunOkPN+5AD5epqJCFbkbOCzdraUEomGGmnhE
         I7cMf2IA00/XmmOZP6yay57uoU6f970SkFF9XKCLIdkHZ33larx1MowqAwyILnFXYL3W
         pgBtdjYlKmoAqwtnpsyyrb6Dv+ZFPAKdxgqSwet9EpJRe04r1LTYfn3rMnjfBh55Pg/x
         7r1oRmeDtkGYqtzMqeDaLQcl9vmJzzfOnrOab/kR/btnsQ7LTIXWe1atgnZgcPvfSL/M
         4uXQ==
X-Forwarded-Encrypted: i=1; AHgh+RoYa9RGQffThNNBD3TaXLA4v3XQDdlH6q0C8Hm7a3LtVzcXFGPlzMz7fIR6siot4pMey4aYgdqeGEdtuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbG+lBBgg5jn4Pf3WVnodrSophQD9hJSJnk5fxbCBRqXUYR9c0
	zkmVd61NKUqyFdJJZpNzhKhq8eYVML1tFzK7Fsfr1xxuIXhvygYEzTcp
X-Gm-Gg: AR+sD13NdiUzWo8oD852sqGx2H8vM0EAzIkHBqGetvYALGsVLud0eTC6BFXUWH0EC/1
	Y9yBnmPo45xXDmlG7MQ/PevPauRyKvRtBMD0DMp/eZeeFTO4u4yI2V7JZUhslnb9B48SFoE6xXm
	Q4xKgOxW0OPpM0ILuODiullPP8t7OAQbIMvMe10WNKvoILG+9ZU3aPSAJDTtrm9HmuYJxNCL1xD
	3QoKnlpP+s9lRCvVjDPFMc1wE+9XG7YImi8JX+lMPetZ8zzgtNYLU4jwHpGVggBxzej3VVuzL5b
	GPFLESxQHk7MK1z2DBrugT0FD/F8BpfviBmMkrNjM6q4y4xEdaR1uaQedbfw8zXgjieu2xxMP9+
	Wc7bKoL2rQ8f3qaL74NH4kRb998HP5sWi3AWGyxWrtZu67I+xjJIs0RTkuiC8wCWpFPRJPVZiYm
	v+LUJ9OmxkMQ+7aTiS8X/Iw1QkxFk+wk2017R+IvXHbPIpQ1xqMTqyffnfncDBEPLTqypbzUQO/
	Q==
X-Received: by 2002:a17:903:3c44:b0:2c8:1c05:16aa with SMTP id d9443c01a7336-2d31796ab76mr2303115ad.19.1786415815459;
        Mon, 10 Aug 2026 19:36:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f3ffd5sm466725ad.30.2026.08.10.19.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 19:36:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 10 Aug 2026 19:36:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Szymon Wilczek <swilczek.lx@gmail.com>
Cc: Zhang Rui <rui.zhang@intel.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (coretemp) Fix core_data leak on CPUs without PTS
Message-ID: <10f80e4d-a0d8-4413-873f-3b1158075e01@roeck-us.net>
References: <20260810192344.3733721-1-swilczek.lx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810192344.3733721-1-swilczek.lx@gmail.com>

On Mon, Aug 10, 2026 at 09:23:44PM +0200, Szymon Wilczek wrote:
> pdata->core_data is allocated in init_temp_data() when the first core
> temp_data of a package is created, but it is only released from
> destroy_temp_data(), and only in the branch that handles the package
> temp_data.
> 
> Package temp_data is created solely when the CPU supports
> X86_FEATURE_PTS. On a CPU without it, coretemp_cpu_online() never calls
> coretemp_add_core() with pkg_flag set, so pdata->pkg_data stays NULL.
> coretemp_cpu_offline() then skips the removal of the package interface,
> destroy_temp_data() is never called for package data, and the array is
> still allocated when coretemp_device_remove() frees the platform data
> that pointed at it.
> 
> Release the array in coretemp_device_remove(). destroy_temp_data() sets
> pdata->core_data to NULL when it frees it, so the added kfree() is a
> no-op on CPUs that do have PTS.
> 
> Tested on an Intel Core i5-1135G7. The driver was instrumented to log
> every allocation and release of pdata->core_data, and the PTS check in
> coretemp_cpu_online() was patched out to emulate a CPU without package
> thermal support. Without this change the array was allocated and never
> released, and coretemp_device_remove() still saw a non-NULL pointer.
> With it the array is released and the pointer accounting balances. On an
> unmodified build the release still happens via the package temp_data and
> the added kfree() sees NULL, with no slab warnings over repeated module
> load and unload cycles.
> 
> Fixes: 1a793caf6f69 ("hwmon: (coretemp) Use dynamic allocated memory for core temp_data")
> Signed-off-by: Szymon Wilczek <swilczek.lx@gmail.com>

Applied.

Thanks,
Guenter
