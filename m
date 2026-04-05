Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5411552FD
	for <linux-hwmon@vger.kernel.org>; Sun,  5 Apr 2026 13:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775397214; cv=none; b=MBU+YLDs8rgo93uPw6+/4z3h1u1doBweYx55coBKmZOe1B36FCgLR8Z5WVTFPJnMKv1EcjOdtphAzhn9d0K6pKqSBpi4PU4em7rDZPufijK5P2DU8EvTqKLeuzkcjqw7tjV3UrY/vL27PPqGVTygnhmzm4nsL+hBFzOwKSQZCOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775397214; c=relaxed/simple;
	bh=Hz/wV/icBwsp1zJRcyMHCfv0bmsgKW/aRchdpAMmjXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ggfk3n816e7fQPosMZUWye2uIk8J+FZ0w4yxUVD3O0o45IaWwTozD3lNCB8FgpLL0boAquKDLXs2XaJudwQqrBsYx0jAU/7DFtg7ls/ORw+3SgCBKrdWdhWFwRbRPEnYpefVg6knD2BJ9x0Ml4J1cJTcT9QTYSLy2OoqMqlg9kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pSaoIa4d; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pSaoIa4d"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2ce22328930so1331021eec.0
        for <linux-hwmon@vger.kernel.org>; Sun, 05 Apr 2026 06:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775397212; x=1776002012; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ATEUJSVwNS9dA7Z3WbM65L+DWmr/psWA0WtP3C9J+xw=;
        b=pSaoIa4dUv0Q8IfXnIOfe3B+w9hQ1WAP/N9/6L8Owb+mwcE3Ji1lFweWp346yuLz+4
         Yag+acjN6dRcjJPegRMIrd6za91fy3vUgdNN1hY+W1UVL2s5yM8JGHBJS/I4Ibti5Dds
         HJT8vEstB4Cu1F8kDjB7Z6e/2v7yuvQlf6CiYFfCKJcxUdA9elBJR9OXLk8Fv3yCUlLZ
         KdL1/nhgF8U5T88B4V9wheh3REXjQCiadR0Tc0eOCnm3IGBgv+68qIzygLuCORAy6MJ5
         HMNzFNIM3o2UXUuNZoiUpGficwv1t3ZPct8kFwqiHLy2IqCrqxRs/26FyBAhsE2zz6dx
         Fh2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775397212; x=1776002012;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ATEUJSVwNS9dA7Z3WbM65L+DWmr/psWA0WtP3C9J+xw=;
        b=jUh+/kEfLxOTvcGoVAZQ34OmVVWgfMim3ZTHbivX5qpfm5OrwQDyvcEz4TkJ0afvht
         pYNUCNztJltYLx7D9EfxlD3R5i/LQ92cDK31UbL781SDi58ezs5SFTB3rWq58Zo6TN35
         lfV99QwDvSTr06KduHe4alENoW/pxMyRe+9L86xQyMHSq/SoazBbv6DV/EuuFnHRdZrF
         IusY0UjkYgNq1a9qpseAQuoFP7Z31VWJNU/BnSUFdB/8vEG5IZH9MjCvLdXrgaAxRi24
         scI7RYukVIBCaVKb0hdPMfcnGsniSlPU959KtjT9xOzXVwwFTVLd2fkNjG+4s8jI5+p2
         gGUw==
X-Forwarded-Encrypted: i=1; AJvYcCUFtv/TgIK65HpXmi7YgUtMRwApdod2hwWtk8UzwcIviZPJvmX/aomz5nmlMUA2RrtgC6PMXwSqxKLpEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRFU6Rg8KTTxVMO8PJ2dtfgZ5SJeJlw8r7El72gn+8eYWqo0j/
	MWYUtNLFiRmiCu5WRNpdMCHaGuCRld0CvUBhkivaBjfDL4VKanAsyROC
X-Gm-Gg: AeBDietrjMF05DjlpHxFWhXBV2wZFT7Y48kmTdVz+FsANP4ynkypGXx80rYdj1pUZpj
	4SIKX07xXKU57UkDgFK8ogXEtcuCn54rrnvqJ1B2AFvCScoksAMIqJgYMYKQgWVcuxmiH9AUtH8
	XRUUhL/PcYjXHxEYoh17/rjljHfIVpnWDQE28lT1e5YEYCMfyTcL1ho8CNjbKK7M71APQMpI4/F
	pzeZQj/X6Cw+ZAPTfoMqRNuBrhbo1GNjRdt1HGFV6t35XkSKZRJD/ojpsbxV877npQjKEYBfXWM
	QOHVvZGl0VcZ9crZKn4aHMK3Grf+2P5zasgRaI1f9XI+Rubgi7Hgqjn1LknBqg8LVNqBwGY2OTC
	HG5EfEwz14paR/wQrIZBWI8ibsNlNn2/MkpxG/iDt10X73kkp9AYSRqBmlq1+GNpxERZ193947x
	Fdpg0WOkumJ8P3G3G177CHVoYZ6Nef5qYzjqUdwxPtrLtCkWvIm4gfvwcgaTfT1MCgNRlGgwRf
X-Received: by 2002:a05:7300:d107:b0:2ce:7d6f:750e with SMTP id 5a478bee46e88-2ce7d6fd2b8mr1276736eec.5.1775397211474;
        Sun, 05 Apr 2026 06:53:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df3b84sm10088894eec.5.2026.04.05.06.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 06:53:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <08b6a66e-8f51-4bad-81bf-134fa7d62442@roeck-us.net>
Date: Sun, 5 Apr 2026 06:53:29 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] hwmon: (gpd-fan): rename enum constants to uppercase
 as per kernel coding style
To: Pei Xiao <xiaopei01@kylinos.cn>, cryolitia@uniontech.com,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1775378028.git.xiaopei01@kylinos.cn>
 <4bc7713ed28eb00068b54c3c3008308253ec32a1.1775378028.git.xiaopei01@kylinos.cn>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <4bc7713ed28eb00068b54c3c3008308253ec32a1.1775378028.git.xiaopei01@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/5/26 01:40, Pei Xiao wrote:
> Kernel coding style requires enum labels to be capitalized. Convert all
> enum gpd_board constants from lowercase to uppercase.
> 

While this may be the case, the hardware monitoring subsystem traditionally
uses lowercase for chip/board/system types. Changing that would be a
tremendous task, disrupting, confusing, create a flurry of patches, make
back-ports more difficult, and it would be completely unnecessary.

NACK.

Guenter

> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>   drivers/hwmon/gpd-fan.c | 62 ++++++++++++++++++++---------------------
>   1 file changed, 31 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
> index 7df46027177d..404155dd97bb 100644
> --- a/drivers/hwmon/gpd-fan.c
> +++ b/drivers/hwmon/gpd-fan.c
> @@ -27,11 +27,11 @@ static char *gpd_fan_board = "";
>   module_param(gpd_fan_board, charp, 0444);
>   
>   enum gpd_board {
> -	win_mini,
> -	win4_6800u,
> -	win_max_2,
> -	duo,
> -	mpc2,
> +	GPD_WIN_MINI,
> +	GPD_WIN4_6800U,
> +	GPD_WIN_MAX_2,
> +	GPD_DUO,
> +	GPD_MPC2,
>   };
>   
>   enum FAN_PWM_ENABLE {
> @@ -60,7 +60,7 @@ struct gpd_fan_drvdata {
>   
>   static struct gpd_fan_drvdata gpd_win_mini_drvdata = {
>   	.board_name		= "win_mini",
> -	.board			= win_mini,
> +	.board			= GPD_WIN_MINI,
>   
>   	.addr_port		= 0x4E,
>   	.data_port		= 0x4F,
> @@ -72,7 +72,7 @@ static struct gpd_fan_drvdata gpd_win_mini_drvdata = {
>   
>   static struct gpd_fan_drvdata gpd_duo_drvdata = {
>   	.board_name		= "duo",
> -	.board			= duo,
> +	.board			= GPD_DUO,
>   
>   	.addr_port		= 0x4E,
>   	.data_port		= 0x4F,
> @@ -84,7 +84,7 @@ static struct gpd_fan_drvdata gpd_duo_drvdata = {
>   
>   static struct gpd_fan_drvdata gpd_win4_drvdata = {
>   	.board_name		= "win4",
> -	.board			= win4_6800u,
> +	.board			= GPD_WIN4_6800U,
>   
>   	.addr_port		= 0x2E,
>   	.data_port		= 0x2F,
> @@ -96,7 +96,7 @@ static struct gpd_fan_drvdata gpd_win4_drvdata = {
>   
>   static struct gpd_fan_drvdata gpd_wm2_drvdata = {
>   	.board_name		= "wm2",
> -	.board			= win_max_2,
> +	.board			= GPD_WIN_MAX_2,
>   
>   	.addr_port		= 0x4E,
>   	.data_port		= 0x4F,
> @@ -108,7 +108,7 @@ static struct gpd_fan_drvdata gpd_wm2_drvdata = {
>   
>   static struct gpd_fan_drvdata gpd_mpc2_drvdata = {
>   	.board_name		= "mpc2",
> -	.board			= mpc2,
> +	.board			= GPD_MPC2,
>   
>   	.addr_port		= 0x4E,
>   	.data_port		= 0x4F,
> @@ -322,12 +322,12 @@ static int gpd_wm2_read_rpm(struct gpd_fan_data *data)
>   static int gpd_read_rpm(struct gpd_fan_data *data)
>   {
>   	switch (data->drvdata->board) {
> -	case win4_6800u:
> -	case win_mini:
> -	case duo:
> -	case mpc2:
> +	case GPD_WIN4_6800U:
> +	case GPD_WIN_MINI:
> +	case GPD_DUO:
> +	case GPD_MPC2:
>   		return gpd_generic_read_rpm(data);
> -	case win_max_2:
> +	case GPD_WIN_MAX_2:
>   		return gpd_wm2_read_rpm(data);
>   	}
>   
> @@ -349,10 +349,10 @@ static int gpd_wm2_read_pwm(struct gpd_fan_data *data)
>   static int gpd_read_pwm(struct gpd_fan_data *data)
>   {
>   	switch (data->drvdata->board) {
> -	case win_mini:
> -	case duo:
> -	case win4_6800u:
> -	case mpc2:
> +	case GPD_WIN_MINI:
> +	case GPD_DUO:
> +	case GPD_WIN4_6800U:
> +	case GPD_MPC2:
>   		switch (data->pwm_enable) {
>   		case DISABLE:
>   			return 255;
> @@ -362,7 +362,7 @@ static int gpd_read_pwm(struct gpd_fan_data *data)
>   			return -EOPNOTSUPP;
>   		}
>   		break;
> -	case win_max_2:
> +	case GPD_WIN_MAX_2:
>   		return gpd_wm2_read_pwm(data);
>   	}
>   	return 0;
> @@ -400,13 +400,13 @@ static int gpd_write_pwm(struct gpd_fan_data *data, u8 val)
>   		return -EPERM;
>   
>   	switch (data->drvdata->board) {
> -	case duo:
> +	case GPD_DUO:
>   		gpd_duo_write_pwm(data, val);
>   		break;
> -	case win_mini:
> -	case win4_6800u:
> -	case win_max_2:
> -	case mpc2:
> +	case GPD_WIN_MINI:
> +	case GPD_WIN4_6800U:
> +	case GPD_WIN_MAX_2:
> +	case GPD_MPC2:
>   		gpd_generic_write_pwm(data, val);
>   		break;
>   	}
> @@ -472,15 +472,15 @@ static void gpd_set_pwm_enable(struct gpd_fan_data *data, enum FAN_PWM_ENABLE en
>   		data->pwm_value = 255;
>   
>   	switch (data->drvdata->board) {
> -	case win_mini:
> -	case win4_6800u:
> -	case mpc2:
> +	case GPD_WIN_MINI:
> +	case GPD_WIN4_6800U:
> +	case GPD_MPC2:
>   		gpd_win_mini_set_pwm_enable(data, enable);
>   		break;
> -	case duo:
> +	case GPD_DUO:
>   		gpd_duo_set_pwm_enable(data, enable);
>   		break;
> -	case win_max_2:
> +	case GPD_WIN_MAX_2:
>   		gpd_wm2_set_pwm_enable(data, enable);
>   		break;
>   	}
> @@ -605,7 +605,7 @@ static void gpd_init_ec(struct gpd_fan_data *data)
>   	// Before its initialization, reading RPM will always return 0,
>   	// and writing PWM will have no effect.
>   	// Initialize it manually on driver load.
> -	if (data->drvdata->board == win4_6800u)
> +	if (data->drvdata->board == GPD_WIN4_6800U)
>   		gpd_win4_init_ec(data);
>   }
>   

