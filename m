Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1932F0C74
	for <linux-hwmon@vger.kernel.org>; Sun,  9 Aug 2026 22:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786315671; cv=none; b=paVwdECkk2eoHyfsLpLkhBrCTx1zPMf3m/Kzttm0cIiGihFlACgPqmTKIbfmlEH7+RIPFQ+2ry9n7PQCcSttXQA5DcOF76Ciyz+PrZYqnmvJAe9lyIjRjz6746BdQMRoMRlEfk8b73ONwpZEcYy6p01p/aeU6A3Q96uHvrkRApE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786315671; c=relaxed/simple;
	bh=7eQKbi9H6lwMDW0BuRtpPcHm1ojEdQdv+td/osI0L+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IdZZimlBpUEYVBaNIzuabB7PU6q84eNtdTkKy6hw/xvsY/bjNho62M3YrCfKvtPIzyKQ7KTw8Wv4vsih5cIXbeImnfuq4ee8JDURjdZN6oiP6yIHr6satrR2lTv/bcxHE2jV1SfzAOqkMLOeMky1fm950y5F+i7/MPHG01rQunA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mkkMWFr2; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mkkMWFr2"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-39266382df6so1267812a91.3
        for <linux-hwmon@vger.kernel.org>; Sun, 09 Aug 2026 15:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786315669; x=1786920469; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EHSSOEpvhI+W25FvdjNvlDYK2Y6ftqlzZ6mGw9r4mzk=;
        b=mkkMWFr2iGr+tvft7jB7+n2FsHDdACGWbUFFmLXneXGNCY227Bh8wK1GPNVuMso5ht
         XQWk4PSqCVIYGqPFaj+uIh0nD87xmMZ4Q6+qp09kEMeZu9mcaawgjKWbysSwdI/YQ0nG
         ZUifXcLe/0t3wWDhGLIJpR2s6ryRe2jrceLPdEsVB8rt7bI57mNoug1qwgeezp635LqU
         OrRbUrc4BJeSR60vqVAw+4tJwkUmXXGaMrjwTB24T1qkX1c7YBgb189ZYtbKwlPYWfmb
         5gnHGQ2s1Fn/1IOKA8cDqM7fAPzGydI3js52tHJjSz/jZnH95o2xlER1KI/dnXam9D78
         KGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786315669; x=1786920469;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EHSSOEpvhI+W25FvdjNvlDYK2Y6ftqlzZ6mGw9r4mzk=;
        b=iOes03pmp9SGFG3OylHh7EOcWpLzrPEnxr2kHmHy2Rr/snPwuIz0jPO0rty8esBrzS
         7JIsB4h4veS80VSzzPqBHzGKApKMkD7uObYhvxWPJ+p5fpwYzlenKTJXT3LHJWJZCWyL
         it2BfmQSkeOHTjmCM+y50RlmXI3hn2WSg4XhYNTYVmHcUbaZgiHG2RfvlQcnBpC8auaM
         2pO1rBdcad8DhDZzmG+bzj20EaWce1jb9hUVYepgeTm9o7cQLfqLE/+/4G0KtNyiI7VK
         eOskYmedQz8UbZPScmwvXLAO321/UsdIcP5yAkK0PD9bxC7cPwS0gNQyjh9Ub0aJJUwW
         Oqdw==
X-Forwarded-Encrypted: i=1; AHgh+RrgJTclH/U6Dk73K1aSQGo/mAJYNfmxnxF2TYgXuThhkz0TcSG15ALVExlVY3sGKdFibKmgsjKDfx1Xcg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4KnINzFWnAdO+zKsO8+Iv/9AlO6iHINJx32v9IzHXo+/FUBNx
	O/L5GViAGkGeCP2vmGm/90dUGbkXmktSKOTe210SJj+Iqzy5OE8TApl2
X-Gm-Gg: AR+sD11gbk9jJokBvpAik+bRLMM/bKPl+AsxyZ2RZxZdd7w4EzfCzstDxDtLsskap5M
	bEWTrOuQ5FNBXzwJFd0gJwYGz1+3fUmQWc76WzASgoHzkePJAJJRk7NkOAA2CPY8D2L7KM1snql
	jDckUfvWgNDZPimUebteGkqw71M01kdEaRr8DMDTSeyE8SNYkpTTBBaGaDKB52aeuQ6mQXahxQO
	Av9Ow/qjGiYOF8QIYHFYM43VfZ+0PD6mSE4gUt6w+ikfQX/NNuH4xk3LSSJgDqywfkCJt7uSyBs
	RoliIcAiKyeoK3DHmyCjgcmqH+XZGRs+jeywntt1cgcOLkh7cBpbDHQa1gAJh5gd5T5HH2g/HVC
	gS+UhEG+rVqKn1YR4Kz5s3I1yC7zUdGONIkGvItXlowphAupUIrJUBVrbLK2HSzg+BVO/rBiiJX
	/yGpA6iWPgFHIGUMcF13XQoRSnK/RqGmOCRYOzlzQLCY0OGVQDj6SdKQxOA00EMdVRpTkK1wT63
	LWmoa6dJhOW
X-Received: by 2002:a17:90a:ec8b:b0:38f:aab1:5148 with SMTP id 98e67ed59e1d1-3903c5d313bmr40425670a91.13.1786315669157;
        Sun, 09 Aug 2026 15:47:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925ff24b91sm9681127a91.9.2026.08.09.15.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 15:47:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 9 Aug 2026 15:47:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Rodrigo Araujo <araujo.rm@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX Z390-E GAMING
Message-ID: <803dd4d8-9569-4e7a-905d-4dea1a51be4e@roeck-us.net>
References: <20260809212705.1501382-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809212705.1501382-1-eugene.shalygin@gmail.com>

On Sun, Aug 09, 2026 at 11:26:53PM +0200, Eugene Shalygin wrote:
> From: Rodrigo Araujo <araujo.rm@gmail.com>
> 
> The ROG STRIX Z390-E GAMING and Z390-F GAMING are essentially the
> same board apart from the E's onboard WiFi, so they share the same
> EC sensor layout.
> 
> Signed-off-by: Rodrigo Araujo <araujo.rm@gmail.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
