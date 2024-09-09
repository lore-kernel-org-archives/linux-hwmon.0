Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76FD17E007
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Sep 2024 18:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725906194; cv=none; b=BmnFf9RVL/YtuapiRaClBNf8kSf6sa25Vi9IIOVJRwSomwfVxWtVgiyEnTAxs60dJ3A1CXja0FpMAcp8PYowDdnignyQuF/BrY6p7rxf9nwDwIqWY1j9bBHGWwLFoGR2uWOd0RHwAXy5cTiV1WgIy19siinsSaDaGl6wfnmKSV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725906194; c=relaxed/simple;
	bh=1aitMlV23kVkVlK+hhq13LkYQUy97YyRmnk0qYwLNpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KcXaAILcnvE0Xfsw4Gtp2v38WDV6x4UKMQcrmqDZ2amoXg9Te6oWCxylsQkzH4QSFV2jBHJKV/FgIRgIBWnj3RpAz2jh/gCqIhnUyELvaGQkFfEebEP5fCzcsrWhGH99euLRUuyfTxX9y/YnlWrkISDAaWRqCo/BH7cuXYIlzCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=protocubo.io; spf=pass smtp.mailfrom=protocubo.io; dkim=pass (2048-bit key) header.d=protocubo.io header.i=@protocubo.io header.b=eNHlooe1; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=protocubo.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protocubo.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protocubo.io header.i=@protocubo.io header.b="eNHlooe1"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-78f86e56b4cso683277a12.3
        for <linux-hwmon@vger.kernel.org>; Mon, 09 Sep 2024 11:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=protocubo.io; s=google; t=1725906192; x=1726510992; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eO4L9jnbspdn3rrqanyKN+GU+DDQw2EjhWjOuAI0zjw=;
        b=eNHlooe1rI24/CXd0sQathPdWD92AXwjD/EfLUjdXT5shmHcxORb9BDbWIhqY8q8H7
         17Ie4h110kmkztcDV6gQ6leWoQU0MZj86t/g+OSZiLTwRWcp9r31lwvHTMp6zT8lQaCh
         9CQ3tAxbUJQOVnGyFMBpiFivH7G+OpyU0ouQaht/pAEOJnc3gEMdTN0lneAiT+L0KoXB
         tlYS9b/TgNzoujSgsYPfPew7tdAsp7oPYwCCytfrBs/6DC4/JclHdH6YXoH/0Lx3rTmS
         xPsJAHcNIEbq/K8ZY92isPWNeBZEpSYDADqC2PB6VeSxuWj3NpPoBFjggxrlWU+rUrCO
         8Vzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725906192; x=1726510992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eO4L9jnbspdn3rrqanyKN+GU+DDQw2EjhWjOuAI0zjw=;
        b=pJHwVss6wa5z9TnPer+GuIlAaRSl0gqbiK42kgsZ7iVldFmzzo3q+pMCG3OQfzzILR
         07gmu5ZExLKTLkW0TJW0A4Wz9KyJ/qWk+ogR2S5tZ18FwlqPKhgrIFiJc5Ybm1/WQs3L
         tIejeZLC75dBVYh0Qrsqb/qBoBIbcg0pxE5n4vK4A/IOrpo7N6Uc69YyFX/Qw5BPG3qm
         Mt+Xpw0AIg97rEaSU6CyqUcsBCpgacw7kkGiUBjUI6vbJTwcxOEIa19NBK+Jm0E+xNpn
         8qOIVfAP06HMOw8Rsu/XzXr6IfgDzF8mqcYMOES8uo1FeX6HnnCveQWyhoHOtgq/AS4A
         XQzg==
X-Forwarded-Encrypted: i=1; AJvYcCW4CA0HeUkASOOYU8zXeFUWuiXzkBpfERAnrGmT/hh8IvuAs1Zlpp/MWKzghjeKgduyIxVFTVQeVgPjOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyuKgXf69t3TkDOTKP2nfQ18IjnFRguPAiwLdtQ1ZLkvOaZo/H
	PxLxI1Ust6+TBrcieWSS8eQyPk27zFz21AnJ+fnbNUXTRWqZQSeshHEczY3e0Y0=
X-Google-Smtp-Source: AGHT+IHRmLzz8gpcfkuwt9GgoLc7rdf9w2BVWj6aOOK5a0OAJ8CoyNVq5WjyElAeTQosquDXIT2aJw==
X-Received: by 2002:a17:902:ec89:b0:206:a027:8aa3 with SMTP id d9443c01a7336-206f036439amr63524295ad.0.1725906192178;
        Mon, 09 Sep 2024 11:23:12 -0700 (PDT)
Received: from calvin.localdomain ([2804:14d:5c5e:6038::1000])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f3552bsm36716195ad.289.2024.09.09.11.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 11:23:11 -0700 (PDT)
Date: Mon, 9 Sep 2024 15:23:03 -0300
From: Jonas Malaco <jonas@protocubo.io>
To: Li Zetao <lizetao1@huawei.com>
Cc: jikos@kernel.org, bentiss@kernel.org, michael.zaidman@gmail.com, 
	gupt21@gmail.com, djogorchock@gmail.com, roderick.colenbrander@sony.com, 
	savicaleksa83@gmail.com, me@jackdoan.com, jdelvare@suse.com, linux@roeck-us.net, 
	mail@mariuszachmann.de, wilken.gottwalt@posteo.net, mezin.alexander@gmail.com, 
	linux-input@vger.kernel.org, linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH -next v2 13/15] hwmon: (nzxt-kraken2) Use
 devm_hid_hw_start_and_open in kraken2_probe()
Message-ID: <yfdm7idqc445lb2cl554xgsav5nzpfv6o5emlnv37ae67wauli@dcbvtbiwrpax>
References: <20240909012313.500341-1-lizetao1@huawei.com>
 <20240909012313.500341-14-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240909012313.500341-14-lizetao1@huawei.com>

On Mon, Sep 09, 2024 at 09:23:11AM GMT, Li Zetao wrote:
> Currently, the nzxt-kraken2 module needs to maintain hid resources
> by itself. Use devm_hid_hw_start_and_open helper to ensure that hid
> resources are consistent with the device life cycle, and release
> hid resources before device is released. At the same time, it can avoid
> the goto-release encoding, drop the fail_and_close and fail_and_stop
> lables, and directly return the error code when an error occurs.
> 
> Further optimization, use devm_hwmon_device_register_with_info to replace
> hwmon_device_register_with_info, the remote operation can be completely
> deleted, and the kraken2_priv_data no longer needs to hold hwmon device.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Acked-by: Jonas Malaco <jonas@protocubo.io>
