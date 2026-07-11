Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EFD2FE05C
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 07:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783756236; cv=pass; b=Pd9Qq5WoCYAWy7uY0uI+gjUqmFm8x9jDsO8Q4ObyThUpwWZayrRrXxt4npR3B5LiDygi0nXiZ/mAc4uFeAivE507ItnK/DNIXxToO8oRM7kpvYVrDi64meqYtyMwmydmGnKKAdcweSMIATMvB9lb007jppta0lXjd+o1w98qwsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783756236; c=relaxed/simple;
	bh=U9Jb0BnlZCVyY3zzxt2LkEtZpyeicz+02z26oo15cwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HK4ow7cJqRK02NeGE4ARBHLh0AlvkmR+Eva0WD/axbrQz5I2tTanP03QKlcOPWG7oiZu++9UY27uepgbH4QdV90HNsilbYUI3PIEW3kcdlP1wwpfRVK7QlqTmbkZ1h0t/I40BS+kfIV1JL70XrcuCEGTjjo1+TNPef3yFOnxGOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ueq7Wtrb; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ueq7Wtrb"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc73e322dbso16895605ad.1
        for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 00:50:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783756235; cv=none;
        d=google.com; s=arc-20260327;
        b=WJ/cCaSj1EdH85lNfHbXfj4DCx4TJK7UyL7EeBgQXLksItPk0iAccAHarnvdpXvtPf
         s9rwe50hMmT2CzIxOKVr4Gw3vjDV95cz04d5nMCKLfcnmog4sBcKQJadmaAh3tdpnYVw
         qe/ABA8eN6++GoGxIoY/JGjcs3qFzcNrOF6ixkUusYlyE0tirzWPZA0xRgZWc3TdH7Y+
         NDkQ26YgXeOVvZcMBu1A9ORTKIkgZvE/67srxWgIY9yVN+OzohTqrw9+aVj/8F1LPJfr
         PC4yothFheZk0x7gC4SlJrldcwAIn4FE9jxKOvSuoP7drv57Cd1i3VZEqb6QXxZDQNyj
         9i2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=U9Jb0BnlZCVyY3zzxt2LkEtZpyeicz+02z26oo15cwk=;
        fh=VU3Hq/XXOcTbC/vMabiwD6YxltFjyuq8W5SDsyc3y2I=;
        b=QHaSmrDDmX/NDgQuOUcF6TiipM0mIjFEVlfeyAC+4rC7PghphhoFFJ7UhEC/FhTPzG
         j5vRDt3UzlRrCY2xyeJ1HspVn4CE91Km+ixNmYRNpPlEFTxxJ2JrMY+iyzmEEeZy7n+6
         YHjDbx30tga2ma2pMCzC4yDTb2jnuhdP3XqN7pqdpswPYEstvGkQB8Fmbrqujnq1f6Uv
         NGfzhcQaa5V4PHomeT/7diyDha4qXKsedEPZjUXl+kuWXWPGVwDnjEAIToi36OKRBgI7
         XkP59nTQ1svH0Wo+tIVBrEPSe6v89fvGoR6fYh77NWg8VIoP5G5SpT2iHyjd3/Yp0/J2
         gGXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783756235; x=1784361035; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U9Jb0BnlZCVyY3zzxt2LkEtZpyeicz+02z26oo15cwk=;
        b=Ueq7WtrbUWc6WyWXED2HtNlal1zCH0Nv5FdT5uac5UY13PKGoMpQIb2vK545+Lo1Hl
         Mx+4s2EEo8cQXFRgIvj7/cI4n8vWw5dYZlc2CrTAhh4NjDlrfavFYJKRZvYbJXRZE33v
         TXFbOa7LTd0C4xRs/YTfLS+fY8Y2lPSLYCEd0UVlEhMojqQJaNdRJa/5dZc5pmYj+MB1
         j+Pon3Li6R8fkyXqKiByGDhTQw9sy00ai63923+A5WmfK3kP9iXPTYo/0iWKZabNLjsR
         FT1ZMHwXqnjeA0d4zySoNZlXDgeWo/Vwj64WvgepzUSPpCw12EiumupCSOSDbGEgZaRk
         QzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783756235; x=1784361035;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U9Jb0BnlZCVyY3zzxt2LkEtZpyeicz+02z26oo15cwk=;
        b=VhaUobEIf26EfHWJDGJ6CR9VuI2g48Z66Xwj7pmpMW+BNBbBwSzkU6NztuDHG3Ho5d
         vTbSwsQvT2XJUI6g/fBr3C3c8pZ2FqDvZsTtfKKVDRcLc8DEFwRYMM9Pr9d9/phwu9fe
         hXPxSWvs7ddfbPNVD/HESLvNKhvmDf0O2KWRaH/EkWuWVSYzEoRXEkVYLHq86T/lEspn
         DZjkhYx2vlhDgQmzoaVTdot4qyRHBXw2TOCaZMXYaevEDBODu+amgjOKeFLJxtpqIdm/
         ONcFnKtlsgUA9GrI6JsYvHAM7v1n+A3ygCkFHLoH6AsuUNMs7mYIhw3k5NaaqI9J2tQn
         m3Ww==
X-Forwarded-Encrypted: i=1; AHgh+RrIY92XetYbqc3K0ak6XKGptAaUVcwm9o7qSbPFpXonj4xhX8lihnvId6NhzSAP6956lsLTcWKx44pVTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDA7HZIFV4rvjjVH472Xnrigww5U+o3316azaaFNIAvYOyBN4/
	pVnS1D/fsVbNpovYsxwCJZP2e4vQiqmLuItYCrxwhxMgT3Xu8mqtPdANfQkajtsuJCtsG7bzxXS
	iel7yyNbNiJbhUbvDoM8v+SRL1Cr46NUXRw==
X-Gm-Gg: AfdE7cmQvqIOWbiUMRNKzc5Xly2h/hPnaRcAZq884qrcUPWmNvAXug+G0xhMHo+YB0G
	KWya/wYJMskWqlJbiJLz+D0CDICjlGxk8X23y/RV5xDcL4HUcF+6vUeRzsTFbB/TbkhggivxnVv
	PqBFDCrkUE7ZD1vV8cxzpTLqPuqKjag/T+ZnOpezBuwZ9GB8mM5w5rknxO2vdKb9V+xKLgMNBnq
	VBPxofgyCgQi+olrUrP5lZinzt9+YRceoQBuEpxrP75MvGtrZZblGx0q8gd0uRXrgpLqWpgalT8
	FiCugUenyRVPJ3f5F0VITYzTTjZTNA==
X-Received: by 2002:a05:6a20:1449:b0:3bf:6c04:a819 with SMTP id
 adf61e73a8af0-3c110b3038amr2310570637.58.1783756234580; Sat, 11 Jul 2026
 00:50:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709204037.1998433-1-eugene.shalygin@gmail.com>
 <20260709204037.1998433-2-eugene.shalygin@gmail.com> <ce6bca91-ca18-4764-a268-1429b41fb918@roeck-us.net>
 <CAB95QAQSevPFXHxJ0yGonjXee8-qG2KWUKW5YDT+C4Fuji33qQ@mail.gmail.com>
 <5bb24169-6d8f-4401-8650-2a04bf49a2c5@roeck-us.net> <CAB95QAQeLSxETxQCi7A+mwzq+HaceFxzsDuDGzNEuDjdd0jRRg@mail.gmail.com>
 <48f94b33-5540-4084-a1da-7d5b5c02e415@roeck-us.net>
In-Reply-To: <48f94b33-5540-4084-a1da-7d5b5c02e415@roeck-us.net>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Sat, 11 Jul 2026 09:50:23 +0200
X-Gm-Features: AVVi8Ccf_-0yyfzJsy1uY2Irq5HHkUuMJYnyeG9cirqfOLT2cb_H1hNy6ciUcRw
Message-ID: <CAB95QAR4iq8Sk2F2azM5tv69ZCeRkOojh-jVhN8MO-AxiZWrhA@mail.gmail.com>
Subject: Re: [PATCH 1/2] hwmon: (asus-ec-sensors) add T_Sensor for ROG STRIX
 X870E-E GAMING WIFI
To: Guenter Roeck <linux@roeck-us.net>
Cc: Vishaal Saraiya <vishaal.saraiya@gmail.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Jul 2026 at 16:34, Guenter Roeck <linux@roeck-us.net> wrote:
> That makes me wonder, though: Are you sure that the negative temperature sensor
> values are not really error codes ?

Does it matter? I know one of those two values (-40 or -62) are
delivered by the EC when thermistor is not connected (i.e. the
resistance is infinite). It allows us to detect EC registers with
temperature sensors and the driver to detect whether the [hysical
sensor is connected.

Eugene
