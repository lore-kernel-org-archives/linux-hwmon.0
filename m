Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82B948AE37;
	Tue,  9 Jun 2026 15:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019735; cv=none; b=RLqxmgcy5C3Pe0fhFql9M3zV1Nke/HecMLOWQQxAC0LocxoJuqtoAwMVHpERJL0pZrptgAhEJt6zZMayys2NDwHekwY0dfZY8SMaZpD8xXcxPniY7MSiHZkYNLmWx6+evgVIH/bt3JhTWogZ+SCvVVTa/PICyg2ejrjX9aRNHQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019735; c=relaxed/simple;
	bh=/0rV9UOBIR0nQRVCyW105xjlqpgPDHkvAhTYw6sYHyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=HJeWrxi+QOiczC4RKj9NmkXM2bOKNWHIsRF+iaSIRsfJoRRh1M9i8ejNqVZsmNKXD++W2RuAsr5hhSHwuU2OmNNhXyjpu2mV0FVAHJcOskp6bxyP2urUdGBmV11Cztoez3HDAoEuJe4gOkOVWnWsJabdyo7WdTb7M+HZZ5zD1hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=BCpKGQQU; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="BCpKGQQU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1781019690;
	bh=spY7S6aZAIPuK4hchIF+zhAL2BvYsjnqz/rbatsS4Lg=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=BCpKGQQUJCiL5gDY6mf2rYBKl9RjvvgSg/l02E6Tgx1youvYsYQjqxVHdo3z6kH7m
	 ayuzoX2hUR7n1hd6Ru/w9DOx64VNVFyl4EQBwNM3fNIDAlWxqNLsWLXtLDgejReOfV
	 5WOusrN47ul6QYzuEfHg3O+lAaDOiLIT1o84wcq8=
X-QQ-mid: zesmtpip3t1781019685t6acd76f7
X-QQ-Originating-IP: FQWazpGncmpY9D2WLn4QpZjxDO5L/vKsamlBRAf0xMo=
Received: from [IPV6:2409:8a4c:840:3635:da00:9 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 09 Jun 2026 23:41:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 9153680702463427982
Message-ID: <305E2395B7027B5B+e851d97c-2af5-4752-8c1c-7f92884fe874@uniontech.com>
Date: Tue, 9 Jun 2026 15:41:24 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (gpd-fan) Reject EC PWM value 0 as invalid
To: Pei Xiao <xiaopei01@kylinos.cn>, linux@roeck-us.net,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cbdc1df2ed3443b08cbd1fc2652638deaf798c4b.1780990542.git.xiaopei01@kylinos.cn>
Content-Language: en-US
From: Cryolitia PukNgae <cryolitia@uniontech.com>
In-Reply-To: <cbdc1df2ed3443b08cbd1fc2652638deaf798c4b.1780990542.git.xiaopei01@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: MwQdfXoP8nuzJAZVa54HSlDpiQIOddz3simCKZVPk88IH8rD/Y0mYv5R
	MCHWOU7mQhqmEeLiutY9TG674kFgzLQgQnb9VSdhvMQjw8ifG3yhtKFToIYL+DeR7byDeml
	YvxdrStecd4c/q9gK/4MFUMeji4EaJDcK0DvErUVkAMh/WFEJlDxN2rj3EESkueShAKwfop
	yPfu78uip2M5j09G1vcCF2RkHLNSv/SbngpUkcRGxqJ/806a11DqTie6GED9uULvDlLBprl
	UuXNuGSXI/KyLpBvUnbBr6j1Elejc89E2awDgjd+yazQ/ij22CtZJTRzxwU8425Z/1dIQ1z
	EMih3n4YB8v9tC4C+ulDVitks+ITKBEngoKghCXSmW7YrMYG2hqT7oIC88YKmOEolzYreMZ
	lfG0kR+ks0qo2iI7xCSKCzK07s3E28+ktzQ8AICqnHp+P3xNnCVoQbUeFCd2hWalNCHjm2P
	lBl2DzVXQzAKfhiuw/lKO1e5AQKSA5Hrhi96HKi9ttkKMc8snn6eXKoKUdGhdUgAmen5nuH
	fqLrraX67ThUT8jjb0pQO7VuEZQZqIzm0TwN0Owbboi5TnmLNYun9VjRF0OE5GxvdSUm+yG
	Ns1f9QyCl137l/SnSB1Yd1QFttm1u3jjPiiKP389EV6QKtzm7p1Dc4T7RH5UCp+HV84W9la
	cbhxjAeho07Uxr15idkVyv64VCgpHODkkeQjDCXODFBkjeOSGxnZTBctaHbf6ksqYoqu1f3
	A7Ds+617NI2RZbCRzj1GsIkNbTDUON5hrYptD2JecFs6RZVCAMOZNhMj5vS4osMwE0QLYaQ
	WHcdywJP3JLzKyralsFA+MXrn7w83hZQwzh2ElHnnzb2h2/KzF1UmnscXJMPC9VOARnhcZi
	e/B+S3zBp5Kfeh+tibtQ9WeUWJPhw8OulrSwqdrSd9GI21IwoAH2CxyKqvX4Kq7P7BMe3xJ
	5YifB63EOJIXePCjcdWfwrnbvGLr4jCZxiI3TXdpDs8Pm7bzILzaNyEJSiR7ssE84V3BdVO
	bFLtDHn8Hw+BuJ3YglkqT3qXpco/2AVVV+ol581gYs8dgcD8ML4nOQNv3xHME=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0


On 6/9/26 07:41, Pei Xiao wrote:
> The EC firmware is expected to return values in [1, pwm_max]. A read of 0
> is illegal and would cause underflow in the conversion formula. Explicitly
> check for 0 and return -EIO.
>
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>   drivers/hwmon/gpd-fan.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
> index d1993cd645cb..decb61936b95 100644
> --- a/drivers/hwmon/gpd-fan.c
> +++ b/drivers/hwmon/gpd-fan.c
> @@ -341,7 +341,11 @@ static int gpd_wm2_read_pwm(struct gpd_fan_data *data)
>   
>   	gpd_ecram_read(drvdata, drvdata->pwm_write, &var);
>   
> -	// Match gpd_generic_write_pwm(u8) below
> +	/* EC PWM register valid range is 1 ~ pwm_max; 0 is an invalid state */
> +	if (unlikely(!var))
> +		return -EIO;
> +
> +	/* Match gpd_generic_write_pwm() below */
>   	return DIV_ROUND_CLOSEST((var - 1) * 255, (drvdata->pwm_max - 1));
>   }
>   

Have you ever tested the behavior on a real device? When it returns 0, 
what state is the device in?


thanks,

Cryolitia PukNgae

