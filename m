Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324691DF261;
	Mon,  6 Apr 2026 00:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775437134; cv=none; b=uvkTBzkRZe4KNzjAhgZR/TUINF0k0tHmSW54+fZci7T7Rwh/zoOn2t+tpLLgxOuJcHRFyxZ8MnATINI/m00mnPrpDzJRWlwhzGMbHkxRK/bJ1/40+vxQ97rSuVzAlIUyVNqnLuakqvLXZeczkv/hpVXhSZqVnNj8pMAaZRg5HP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775437134; c=relaxed/simple;
	bh=DWQhfxrzHAO1X1thah8TAqhlqfYnChrwXcs21wTfBXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VLIN0Zz5LLKnBakSe3uXNGoqNUtOMI560iP6+wV1K0MFC/UEFwXtUkjt7AIjYG33/FRzSGtMf6pbI9YpEhJcgfibgbcwrXAqxun+CZfQ1zlE02DZzq6COjL69aTCt0r7k7nFs+a7frRcY8g+LQ7PDE3Bfy5iEBDe1iCDfDoHeis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c354e922315311f1aa26b74ffac11d73-20260406
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:cae75c62-4880-4055-ad96-a1a4ff49de28,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:5295b21bcbfed282953964b2f18a6ea1,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	52,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c354e922315311f1aa26b74ffac11d73-20260406
X-User: xiaopei01@kylinos.cn
Received: from [10.42.12.251] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 314795719; Mon, 06 Apr 2026 08:58:45 +0800
Message-ID: <54570a8c-d8db-497c-be84-45322e6028c5@kylinos.cn>
Date: Mon, 6 Apr 2026 08:58:42 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] hwmon: (gpd-fan): rename enum constants to uppercase
 as per kernel coding style
To: Guenter Roeck <linux@roeck-us.net>, cryolitia@uniontech.com,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1775378028.git.xiaopei01@kylinos.cn>
 <4bc7713ed28eb00068b54c3c3008308253ec32a1.1775378028.git.xiaopei01@kylinos.cn>
 <08b6a66e-8f51-4bad-81bf-134fa7d62442@roeck-us.net>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <08b6a66e-8f51-4bad-81bf-134fa7d62442@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/4/5 21:53, Guenter Roeck 写道:
> On 4/5/26 01:40, Pei Xiao wrote:
>> Kernel coding style requires enum labels to be capitalized. Convert all
>> enum gpd_board constants from lowercase to uppercase.
>>
> 
> While this may be the case, the hardware monitoring subsystem traditionally
> uses lowercase for chip/board/system types. Changing that would be a
> tremendous task, disrupting, confusing, create a flurry of patches, make
> back-ports more difficult, and it would be completely unnecessary.
> 
Yes, follow history. This will waste everyone's time.
> NACK.
> 
> Guenter
> 
>> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
>> ---
>>   drivers/hwmon/gpd-fan.c | 62 ++++++++++++++++++++---------------------
>>   1 file changed, 31 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
>> index 7df46027177d..404155dd97bb 100644
>> --- a/drivers/hwmon/gpd-fan.c
>> +++ b/drivers/hwmon/gpd-fan.c
>> @@ -27,11 +27,11 @@ static char *gpd_fan_board = "";
>>   module_param(gpd_fan_board, charp, 0444);
>>     enum gpd_board {
>> -    win_mini,
>> -    win4_6800u,
>> -    win_max_2,
>> -    duo,
>> -    mpc2,
>> +    GPD_WIN_MINI,
>> +    GPD_WIN4_6800U,
>> +    GPD_WIN_MAX_2,
>> +    GPD_DUO,
>> +    GPD_MPC2,
>>   };
>>     enum FAN_PWM_ENABLE {
>> @@ -60,7 +60,7 @@ struct gpd_fan_drvdata {
>>     static struct gpd_fan_drvdata gpd_win_mini_drvdata = {
>>       .board_name        = "win_mini",
>> -    .board            = win_mini,
>> +    .board            = GPD_WIN_MINI,
>>         .addr_port        = 0x4E,
>>       .data_port        = 0x4F,
>> @@ -72,7 +72,7 @@ static struct gpd_fan_drvdata gpd_win_mini_drvdata = {
>>     static struct gpd_fan_drvdata gpd_duo_drvdata = {
>>       .board_name        = "duo",
>> -    .board            = duo,
>> +    .board            = GPD_DUO,
>>         .addr_port        = 0x4E,
>>       .data_port        = 0x4F,
>> @@ -84,7 +84,7 @@ static struct gpd_fan_drvdata gpd_duo_drvdata = {
>>     static struct gpd_fan_drvdata gpd_win4_drvdata = {
>>       .board_name        = "win4",
>> -    .board            = win4_6800u,
>> +    .board            = GPD_WIN4_6800U,
>>         .addr_port        = 0x2E,
>>       .data_port        = 0x2F,
>> @@ -96,7 +96,7 @@ static struct gpd_fan_drvdata gpd_win4_drvdata = {
>>     static struct gpd_fan_drvdata gpd_wm2_drvdata = {
>>       .board_name        = "wm2",
>> -    .board            = win_max_2,
>> +    .board            = GPD_WIN_MAX_2,
>>         .addr_port        = 0x4E,
>>       .data_port        = 0x4F,
>> @@ -108,7 +108,7 @@ static struct gpd_fan_drvdata gpd_wm2_drvdata = {
>>     static struct gpd_fan_drvdata gpd_mpc2_drvdata = {
>>       .board_name        = "mpc2",
>> -    .board            = mpc2,
>> +    .board            = GPD_MPC2,
>>         .addr_port        = 0x4E,
>>       .data_port        = 0x4F,
>> @@ -322,12 +322,12 @@ static int gpd_wm2_read_rpm(struct gpd_fan_data *data)
>>   static int gpd_read_rpm(struct gpd_fan_data *data)
>>   {
>>       switch (data->drvdata->board) {
>> -    case win4_6800u:
>> -    case win_mini:
>> -    case duo:
>> -    case mpc2:
>> +    case GPD_WIN4_6800U:
>> +    case GPD_WIN_MINI:
>> +    case GPD_DUO:
>> +    case GPD_MPC2:
>>           return gpd_generic_read_rpm(data);
>> -    case win_max_2:
>> +    case GPD_WIN_MAX_2:
>>           return gpd_wm2_read_rpm(data);
>>       }
>>   @@ -349,10 +349,10 @@ static int gpd_wm2_read_pwm(struct gpd_fan_data *data)
>>   static int gpd_read_pwm(struct gpd_fan_data *data)
>>   {
>>       switch (data->drvdata->board) {
>> -    case win_mini:
>> -    case duo:
>> -    case win4_6800u:
>> -    case mpc2:
>> +    case GPD_WIN_MINI:
>> +    case GPD_DUO:
>> +    case GPD_WIN4_6800U:
>> +    case GPD_MPC2:
>>           switch (data->pwm_enable) {
>>           case DISABLE:
>>               return 255;
>> @@ -362,7 +362,7 @@ static int gpd_read_pwm(struct gpd_fan_data *data)
>>               return -EOPNOTSUPP;
>>           }
>>           break;
>> -    case win_max_2:
>> +    case GPD_WIN_MAX_2:
>>           return gpd_wm2_read_pwm(data);
>>       }
>>       return 0;
>> @@ -400,13 +400,13 @@ static int gpd_write_pwm(struct gpd_fan_data *data, u8 val)
>>           return -EPERM;
>>         switch (data->drvdata->board) {
>> -    case duo:
>> +    case GPD_DUO:
>>           gpd_duo_write_pwm(data, val);
>>           break;
>> -    case win_mini:
>> -    case win4_6800u:
>> -    case win_max_2:
>> -    case mpc2:
>> +    case GPD_WIN_MINI:
>> +    case GPD_WIN4_6800U:
>> +    case GPD_WIN_MAX_2:
>> +    case GPD_MPC2:
>>           gpd_generic_write_pwm(data, val);
>>           break;
>>       }
>> @@ -472,15 +472,15 @@ static void gpd_set_pwm_enable(struct gpd_fan_data *data, enum FAN_PWM_ENABLE en
>>           data->pwm_value = 255;
>>         switch (data->drvdata->board) {
>> -    case win_mini:
>> -    case win4_6800u:
>> -    case mpc2:
>> +    case GPD_WIN_MINI:
>> +    case GPD_WIN4_6800U:
>> +    case GPD_MPC2:
>>           gpd_win_mini_set_pwm_enable(data, enable);
>>           break;
>> -    case duo:
>> +    case GPD_DUO:
>>           gpd_duo_set_pwm_enable(data, enable);
>>           break;
>> -    case win_max_2:
>> +    case GPD_WIN_MAX_2:
>>           gpd_wm2_set_pwm_enable(data, enable);
>>           break;
>>       }
>> @@ -605,7 +605,7 @@ static void gpd_init_ec(struct gpd_fan_data *data)
>>       // Before its initialization, reading RPM will always return 0,
>>       // and writing PWM will have no effect.
>>       // Initialize it manually on driver load.
>> -    if (data->drvdata->board == win4_6800u)
>> +    if (data->drvdata->board == GPD_WIN4_6800U)
>>           gpd_win4_init_ec(data);
>>   }
>>

