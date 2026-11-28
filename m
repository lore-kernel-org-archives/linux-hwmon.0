Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795856487;
	b=YdAzayfZbY7ecoPLEJ98R8D7nDXkcGLQw4LW7W1x486HiHDx7TBVKwmjxEaxpoYhsC1L
	 JQxXHJASGNhTSQ9A+yWza5JnS/LuSASGDzbCNWD3B0YA/zDE6rOMNXLgd7oDq25qi5YC6
	 z78dd2aVMrTIQWdtpZ3X1YkuSa58zLYN2KTbB24BiiZrDKtQPyuet0gkrD+hQAfpdSlI1
	 azgfGFQwGxaLZV8I7/e4pDutxpqC966UMGZncoV2V0Lols3z6Bkk0HG2X+9Qy5IWRw9MM
	 rYj01vEjl7E1sx8Xdu5RHsyEcOAlI0my6VHn+K4cIM0MO3jYj+nIX/cpu57MfZ0PGuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795856487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HcMpuSj3oXcRHJx9YaH6Yolmn9BCDVLY7M9wbuven4A=;
	b=2g+9w2Q+6VuYIzCePzPQrUEbiz0U8ST2vwWHPh0P4jqkavY5FKG9G1ApkVnc6CFyHZJB
	 q0p5alwLYIlV05SrC1AC1/4Yhi6ueZc4Q8pVZBPsBDAmAZGwTUCtKaF4vqJL/5PN+QbyB
	 LG0F5CCEEALC84yk1uyRRxQN7lGOjT/pl9wbsNljlukcx9j4wXglE70c0EDfRhgJq8OqT
	 g0ymRdkvBYShfZnL7VaXscTRWb3cqT7zyV2ygzYlE8VXRCTMsAC33bttQ4QogxmOKMjWn
	 pNHcF7ZZjKayII25l/i+IgVoYTWxHhC83iCPVzUATyIO/B/rhmZT/yVsTttnHmjA9CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tF5IY/3N";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64EF606A31F
	for <linux-hwmon@vger.kernel.org>; Sat, 28 Nov 2026 09:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B64EF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tF5IY/3N
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-497614c95f0so4985497f8f.1
        for <linux-hwmon@vger.kernel.org>; Sat, 28 Nov 2026 01:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795856485; x=1796461285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HcMpuSj3oXcRHJx9YaH6Yolmn9BCDVLY7M9wbuven4A=;
        b=tF5IY/3NhVZLJraWtqmB3EY0/xnFkRCRPsJ9yKllFcz3wvjgNLduq5zNjnyhGwCcoQ
         feT/IzhIupjOpbic1CDesYTBZIl6DoXFPT2Mis8+X4iIJAwWNXQirrDJKP7q1akF+SUi
         Z19Ur+LZtz+EH/3CFP4jLBI2mbRhwfh4kZGHL4Dfcc903lY3qk1EX95MV9rl5nCDqCyR
         ksLJZIsf1owWEI1StTx+ylT+TY040/Tf76OIfhRYcOjZKD8OdI7QE/Re/f6tYGmoWLOf
         aNbl5KYQjANQ038Uuh9esT6WJ5raZ3DKIjhG+tyKi1NQHrltm+gvBUqg+YwgRcyWT/Sj
         4vuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795856485; x=1796461285;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HcMpuSj3oXcRHJx9YaH6Yolmn9BCDVLY7M9wbuven4A=;
        b=e6QwBll/Fug1Eg0FvHddGYS+JNvTfEeMoBQDLt6V3HVEwudIcN/0KhyNypY/+Od4La
         okMFiY4z+a1znvd2K2rq0kF4OQ//y8zNNV4hREfgysVo5+RMNe+pLdn5I7Rz2Koc8T4S
         JjyhTI0fyT7qmMwn6N45RjtN1k9iFjIl1H38O/OlmJEKsxIYNYJArEJbl7x+B01JQkuk
         0VMIEbDC4Pu+qA0CtuS0WvYP+Da1CsFKC7nUcFj+ty9JINTUukSFzmIH0X+2ECny4GHQ
         54ln60eXz/tRcHcPtWgW46e/s2jTj8iS9NTlo7RBTj/TrUNI76OkEY6eMJN9D3WCTdvv
         Wjpw==
X-Forwarded-Encrypted: i=1; AL+hErFxu/Q11qjT1Aw9JqqD2J6XKeJj+6d6E8KCWsuSsYR3x+DfwXNpaoIvjALII+PXACRaZ0Ns/mRVgiXA5Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Nv9qHLotc8Ab7Z8Yj4es6/gqOMnv3PTTRw9b2PmmoyPmaWp/8
	jhjsBpFKXOUu3hUKPdWdp1SYjXmjGlZe0koP31t7F+viNxmCl5jdrKNY
X-Gm-Gg: AZFdTZcS4uWdczrcPTDsB2xavMBqy9/j7mHmxQqRZLxleoa0SitsV4zjCguu7a/XKDu
	Tr3NPnj419UALlV0fnn6HEqmWsH3EKbUynA56Jhj2IH7e36XjL2zvxIPRfyS1Z82UVQj4S+zhip
	/GWY4pGKt4/U2rnAFdMc2HqSn8EzjI8eLxwBeQM22aDVc+hGnGsUftskFLE3VTuDxGMm5PX+t7J
	bfduyaiOe1CDzjjatiblH2btX7UTiBMqzxvV0AsEmXbuaJmJLk6W2Gco94+4sq66ZHz3OYYkGRH
	TiyE2oW1Zkiiw1ufufRlhkMy+ipN272Nv5Khiwj6AKwvkHeKYOZbSmeL18WqOkMY6x29JIuMNtc
	hXRkIWQyE0suiekFjcIP93CaETQRwJgFAXubbDDR0olC2WcfC+UotdWKlUOuFitycOSZFgK/LoJ
	5nL7ChZ+kOExeSb/3riOiNV5LaHu+PAW8uql4c+vRiyXpueqo9BBJ2bO56qIuaRkX5Ps7v+FV/I
	vO+vVdup6LLguQ7QfWvSR/oRVXzYNZtLVZ0Wj6b2RloLa/tzb2xXwIj6pKC2FWVKWRs0ZUHxYx6
	Q1UjIBxWEu3/zy5tciCZT+YS5KB6CaMNQA==
X-Received: by 2002:a05:6000:3107:b0:4aa:1ae2:ff2a with SMTP id ffacd0b85a97d-4abaa977260mr63813437f8f.2.1795856484771;
        Sat, 28 Nov 2026 01:01:24 -0800 (PST)
Received: from google.com ([37.228.200.172])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm50089883f8f.56.2026.11.28.01.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 01:01:24 -0800 (PST)
Date: Sat, 28 Nov 2026 09:01:22 +0000
From: Fabio Baltieri <fabio.baltieri@gmail.com>
To: Johan Dahlin <jdahlin@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alwyn Kik <alwyn@kik.pw>,
	Hamza Mahfooz <someguy@effective-light.com>
Subject: Re: [PATCH v2 4/7] hwmon: (nct6683) Enable fan control on ASRock
 BC-250
Message-ID: <awqYYqF0aIDLpcTg@google.com>
References: <20261111082838.1418051-1-jdahlin@gmail.com>
 <20261111082838.1418051-5-jdahlin@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111082838.1418051-5-jdahlin@gmail.com>

On Wed, Nov 11, 2026 at 09:28:35AM +0100, Johan Dahlin wrote:
> The ASRock BC-250 (customer ID 0x162b) has an NCT6686D with the same fan
> control registers as the B850 Steel Legend WiFi, and manual fan control
> was reported to work there.
> 
> Enable fan control for channels 0 to 7 on this board as well.
> 
> Suggested-by: Fabio Baltieri <fabio.baltieri@gmail.com>
> Signed-off-by: Johan Dahlin <jdahlin@gmail.com>
> ---
>  Documentation/hwmon/nct6683.rst | 2 +-
>  drivers/hwmon/nct6683.c         | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
> index 026515c35243..8e5cd1d7dcd2 100644
> --- a/Documentation/hwmon/nct6683.rst
> +++ b/Documentation/hwmon/nct6683.rst
> @@ -59,7 +59,7 @@ fan reported by fanN_input.
>  
>  It is also supported on the ASRock B850 Steel Legend WiFi (NCT6686D,
>  customer ID 0x164a), where pwm1 to pwm6 control the fan headers reported
> -by fan1 to fan6.
> +by fan1 to fan6, and on the ASRock BC-250 (NCT6686D, customer ID 0x162b).
>  
>  pwmN_enable selects the fan control mode:
>  
> diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
> index 29fbf438c04c..f656b84ee8ac 100644
> --- a/drivers/hwmon/nct6683.c
> +++ b/drivers/hwmon/nct6683.c
> @@ -1540,7 +1540,8 @@ nct6683_setup_fans(struct nct6683_data *data)
>  		}
>  	}
>  
> -	if (data->customer_id == NCT6683_CUSTOMER_ID_ASROCK8)
> +	if (data->customer_id == NCT6683_CUSTOMER_ID_ASROCK8 ||
> +	    data->customer_id == NCT6683_CUSTOMER_ID_AMD)
>  		data->have_fan_ctrl = data->have_pwm & GENMASK(7, 0);
>  }

Hey, just got a chance to test the v2 on my bc-250 and it works as
expected, tested it on hwmon-next since this has already been applied.

Thanks for the help!

Fabio
