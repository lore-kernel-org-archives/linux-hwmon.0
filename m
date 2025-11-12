Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEB72C0294
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Nov 2025 20:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762978510; cv=none; b=sWb5Bph0LDlisf3rpIZVT+BcMijbA4W1zFNigfxrM1QVQjrJbPFyA/hvKMNL//EOEiZnHfESjsKGF5ENgKxzLlVko3PEcPk+ceantbCPE6dNzDZWv4e7WIbYbpDPQRh4YyzgA17pfPwVfqkOqYndD7MzCUOBrAQ/q255YceN2cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762978510; c=relaxed/simple;
	bh=Eiwvm6yluoO0JX6Ce6PQ59k7Nip9lToT9ZGCLzyprIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6bX8EWPldVn49hKsEkP3c7kD1M9u54H8U4fG5UQIk3TZ63qsp/Y67z12zqvmDq1qjguQg50Ci/pMnbNCPJvZtVsubZDsmmPFHO1MpJlrdcWgptb6MSoe01IqErwQyQce12qRwOBK00zIT8e4UN5XyvLTJb/reuFfZ0dVSjKTEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zu/WLApS; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zu/WLApS"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7ad1cd0db3bso22036b3a.1
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Nov 2025 12:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762978509; x=1763583309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0of+Alf6T4+63MJiwJGoBZkQR101RqICgRjSBtL9Gv0=;
        b=Zu/WLApS/BNmAU7w1BGGP9SIXE2toxCBoKY9mEcLPd13TneNRhHSEpmS95WE3hKXcg
         JanKlNgEJs9JHh+f9HiHqucs6LLxOAkbfn08WWNfCq2Vlmtoaz+CyV9ELEZ401IRguXu
         5tXQ1BcDEi0XJeXBjYXR7V4hb/dc1WrwE/d7qx8iwsVv1vuKdAvc3Yo//+FIEzKEUb1F
         uCJgObU2Ns0ERtB/ozvJh8p7PzbvjzAihtOf91HF/pl5z5qE27xHUntNwLY4oSg1+UPw
         k7+8uyOLRuBE6+zYYIPrM3eWZvKMdBjnl0EwHA1g+bRVIEZnFBYgbQbiCwjuiMLeetrb
         VreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762978509; x=1763583309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0of+Alf6T4+63MJiwJGoBZkQR101RqICgRjSBtL9Gv0=;
        b=XTwf4UyOpiXbqiN/EWpNgq1TGOz+MAs5901d9M+NADOVRGT4EMtVCMA05NNBfwBh0m
         ZBHD3RIdiAgbraubnVqeI128IB9FsJi5QF3x14p1LgnsY6TLXQxpfU/53r+fbnqrVrAO
         jjJNfCsWLz4zzMbHm4DqDA689Qrs36soKrMxabL4rugvoV0Ctsk5zeMUHdW8Pxw3pmmM
         A7Gup5ETqFiBhu5RV8ui3M7oANMZ34WdFMv07KlgAaEgGK4E6Ui3c9DKchZYDuzG9Emu
         go7NvT+tmI0Bn2PuctccNJo8kcCHvIUcmmiw1Y7WGGIpFvMILf5pwwi2VpAX6CTmVP5R
         QqoQ==
X-Gm-Message-State: AOJu0Yxh8JhRqSu+N6izyyGsoP3WXdQTiZm0lVN9DCj+S6kLo39Km0n0
	BqWFMGejeMcpJHL9pYGSfGAfpKLXDnFZQS7jzmHu53VSlzH78VfSS0ps
X-Gm-Gg: ASbGncuPhbNKwhN6TcruItpLc63HVHR6aJqzc+0KedsA3WD/dYtGHbOHi6xQgeIwFDn
	33sog9aJUkADQ9jKLWKn2c/j11cKhjE8cdOGNMjJrAENliQ367S18zb7EGjnbnnA5ez0EEMlbTC
	Lrq2Pj0Xm7KOs5VIA9Furh/2Qa0ZxQX0U+wqOV3jz3OlvBS1vKDwIWtezMdHQHbSOBhVy4N96s/
	UDN8AW+uVloncU8p+h6Ah5ei3c0sMkKll5AoXyr5/0CJhzRiTk5OrU3Vg/vO4brFwfPjuBlmq/5
	bcVh6UbjWUPt+ZbYcSzNWKumjAIwaD9CzggiswJ41HZ61yN0U94PRwKjej2EeNAUrcY0IFahEnt
	jhKjvZY/JqgHL71QbhWS8abahPv9rEb9Qr10V0F/YWmg+euUr5uJgV1SqLqf0YqkELNxPpfx/b/
	n7HYTjeT89H5K0
X-Google-Smtp-Source: AGHT+IGJVaBzUd+GH5+0F1+fgUd90xKgi2sOsh2N95NvCJUwi0b5/poLRgwWQ0qknWXA4663p3Wuqg==
X-Received: by 2002:a05:6a00:2d95:b0:7a2:7f87:7ae7 with SMTP id d2e1a72fcca58-7b7a4aed5ebmr4413457b3a.19.1762978508405;
        Wed, 12 Nov 2025 12:15:08 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0ccb5c674sm19222420b3a.59.2025.11.12.12.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 12:15:07 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 12 Nov 2025 12:15:06 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Bruno Thomsen <bruno.thomsen@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: tmp421: check error when loading label from dt
Message-ID: <fa23e0b7-c0aa-4c90-9ce5-1779a94221f2@roeck-us.net>
References: <20251111144406.7489-1-bruno.thomsen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111144406.7489-1-bruno.thomsen@gmail.com>

On Tue, Nov 11, 2025 at 03:44:05PM +0100, Bruno Thomsen wrote:
> Add error checking when loading temperature channel label defined
> in device tree. Handling of error from of_property_read_string()
> is inspired by lm90 driver and therefor contain same error string.
> 
> Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>

Applied.

Thanks,
Guenter
