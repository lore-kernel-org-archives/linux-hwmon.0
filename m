Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A2422A80D
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Jul 2026 02:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784256512; cv=pass; b=NuqJu49O5v79WUJ8wm9qwA292JSoP72yjjp/1KXdsRvkEGULGNS4MA6uux9NtWrgEAjNpGO9DKjhvNcKAfqUXiYgLKW+1u4CZ1jXhQwmKy9obSTMknKkT4A7M8mYO2ye5hSOLmDxYBQzLFdyn3LsVix8KZWWnKcF9qpQkljBZPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784256512; c=relaxed/simple;
	bh=Xeh0/cpIX++YPWKoD+NWyrftViTAmvcFGOAmCGY5v7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DLb4QW32RbMbuEadPW7ifAoPoYW5Nti6WpTQ2d71VOYtiWfKACbSgoprBwzuwgOdOKFeHtIdUO95k8nU0TSUjTpwkv64p+SGE1zKXG5dZUL20OeC3+sON2wOM2APWP8wsHEzCAAPgkSTQZPXhyPLIHiGQRnEQePqf1oYy8aOSew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mE01Zffm; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mE01Zffm"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c1677c91969so321737866b.1
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Jul 2026 19:48:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784256509; cv=none;
        d=google.com; s=arc-20260327;
        b=HuixJvr8/UNzPVrVRaGswBtC7mbSF+WzKLiqhql7ht9raDhf7dDSVoSxcKRIRY+zAk
         jHYk+Tr/6ThHMI9vYNmS5EP9SnwuFd+joKT5treq2zide52NesK7g+rGl+NnQOXzPMid
         ZhrK1AbO6lWysBmoR6/NCPry675x+GCLjK/vT7QWxJmtk1N8jTPakguxCfYILosG6ntb
         eXD42LgQ5a50PnLsPy9jLOwTijV6tWsrK4HfM0IX0CZSwjeY5jOpO/nhWx+XAATcaGc2
         6CMNmog4CwblMBHav58BFXbY9IU9IR2OZuuKLvTecLfVPf1gjM+8+RULsn8/v+h1JfTp
         sbow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Xeh0/cpIX++YPWKoD+NWyrftViTAmvcFGOAmCGY5v7Y=;
        fh=Ad6qDDjrtQXzFxoLrXURrC72oVIOza4tGR/I5Qyk72s=;
        b=oUgnu3zijNJz4hkLQsWnTpN5RVX5ZhB/LqX287A4mCjdipdyTNvLRXZLbtX944eHH+
         LV6aJ6cfoAC0dDlgQ4oozsoyDzbUnPH1qbbGXJgRJYED4OSBAt3tCvjdKGk9jQcykHvG
         YAqPWSZ8qRwepsc9gH5gPXcbu+vVG6kUpT/cOh0bKLV+9PsRekphnDY1+rjY9hwOWlZk
         nsB7B9sxHrEpRKeqjAML99A8bQVJwx12o1G34fvPBlJQ31jEIHWhGmm901RRszj/iJ1H
         dMxui0qgC8LUFYmaHPdia3zHbmH+QRDr2cAS4dBS4cq3b54f7NYfq+t0vbVXxo1OMFs4
         qARg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784256509; x=1784861309; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xeh0/cpIX++YPWKoD+NWyrftViTAmvcFGOAmCGY5v7Y=;
        b=mE01Zffmh8ckiAJA0rMP+NKoiIIbrCnec5AJxiLlmmc1M72Dyg8PoQvF+yfrVnzTTJ
         PrySwLxxeAy+JdGZnc8IhjxtOk/gDP35V3Rf5TIcoFSF3mCEojKUKQgykAVLv2gNnUJn
         lF2Q3g8fS/2YPG+HN5qMNC0P+SD3Jax4XeGNk2XrRDW7hmT9yKw0v2sJorf9rH8OXuik
         S6sajYmh3BIqhkHme4CDjJfhFwjeRZvcg7PzL+/Pa5C4SAzZgL92nMJmcmWqf1JLqU3k
         5rxvbcZ9Pu8/YL1ycsFMYtQ4Q/A1DGnMIjWxtr2WA5ezu78mJgFwfr5iXLxxP82aYXZ+
         VmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784256509; x=1784861309;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Xeh0/cpIX++YPWKoD+NWyrftViTAmvcFGOAmCGY5v7Y=;
        b=F4BA4YibhJLaih7KV+j+iEOlMN1zIBUOrJnHHSDTUrxab/E8n1re+ZAysUdrf+W8s5
         IyQt1ekfviBP6DC4feXdxScE9+UEAEMeqUUC7ncM0YRle7TdQPs3SFx4zVNs/T8I6iH9
         5sfkhoSiSNU+idsUiVbzuNWQ456k+boXW7GocJiFhsFb8tG6y+2Zj6N2XYiNtemkcN3h
         2QKT9cU9Uwy6JQxNDTS48h6CtFMsz354f5T+VUD+eyontv9YElgdcjYdKj0Ipx9sxQKK
         qLJnNyv1wqfUSrkarRK8OCbFPak/anujaqySZsVO7ZwL/QDVcI4GJfgIdZTC5DMZnnET
         SMlA==
X-Forwarded-Encrypted: i=1; AHgh+RrHmtS8G7dQhd1XbHEokRmS7UYYrnCbfzSAK7VbEPtvhzG+OFanWFlcgG9himwqumx+WcXRHiOTb1aOxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuq1T8y+rYPhIN8BSiKb4l/7hfMzwx0KnCPlQNbu8k0CRivC4n
	USAxG7NVSI/oCE0hx7r2AcXqwJp6ecdSWk8zL3UgMmvSMQBU1FX83MfJNjc35n5pdyyWRBrnXff
	NCsui2oIqFpiur6wCBVKL8MZuSYpA+wK3Zh7U
X-Gm-Gg: AfdE7ckMcWS/6Ybzo6xabL36v3ejVecb2Le3jeoNSCwBrFGJ1BjhOALUGb7/R4IxVPF
	4lgnvu2PVzNumJXoPBqqE/LEJai9mTXmBNM8gURXBAV91soc8lEsLioidLuJVxldCpYcM+10++z
	5wQ/hj4Fhkf6bazjIQsJl6uJkTbp1BmrpOml3VtFQgIVRCn3dCXXiQrc+vB7YXsa+usICZ1KY86
	VQ32jSafT4PCUQfrrQfdmR6+kq3nx2lV+68FekPG8KsPJB5NJlkcDVr06d60bYSm2QqB2FsMaaA
	F6MpOhiRWE5Y3kQ/Lg==
X-Received: by 2002:a17:907:1b09:b0:c16:8aed:cec3 with SMTP id
 a640c23a62f3a-c16b48643b7mr18580866b.58.1784256509566; Thu, 16 Jul 2026
 19:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com>
 <20260716-adt7470_thermalzone-v1-4-cc55ef35edde@gmail.com> <091279bb-391e-4c0a-8ecc-a51f95be3f27@roeck-us.net>
In-Reply-To: <091279bb-391e-4c0a-8ecc-a51f95be3f27@roeck-us.net>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Thu, 16 Jul 2026 23:48:16 -0300
X-Gm-Features: AUfX_mz9AVIsM_AQi3achJz8IUPx3rvSBxfgPtBXoYk3dxmYM3rsybnFUAJ9i5s
Message-ID: <CAJq09z72Na3yzdei_BVd69sLKFttWZP8vmF3gf66A_qYZ2Yirw@mail.gmail.com>
Subject: Re: [PATCH 4/4] hwmon: (adt7470) Add thermal zone sensor support
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Detailed explanation why HWMON_C_REGISTER_TZ does not work or is
> insufficient goes here and into the driver code as comment.

No need to explain anything. I was just unaware of the existence of
HWMON_C_REGISTER_TZ.

You are absolutely right. I'll refactor the driver to use it and make
the code much cleaner. Thanks!

Regards,

Luiz
