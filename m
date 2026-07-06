Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CFB3DDB07
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2026 14:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348267; cv=none; b=F1VaD95GHy/PmBABK+3bOlTNefE/axV2JEbYKLIzbWB7+BF1AtfwESQYazv3mYmPhzFFswAxfO1sfap+ztl498wqHbZ1tCq8Uan6qNhz4wNODl3tIs9kLxg2U7p8KgLJLBwChT6D7pLBF0C3seLawKH+9xg+fanCX/sje/rPhdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348267; c=relaxed/simple;
	bh=w+ezLx8DcFVn3ydf3SZCnrwVI2j1LA6W1gk0f4A09l8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OPCx3en6yUCgnoVuNC7wYBovVVS514Bb0mK8zYMlz0gSrmo6W5eRMbNmibSDKnvli426W2d0XO4FGD8+NKYlngVLi5MUfVL0z4wdHv2E0M5vp8VpBzP/8mw4rdzzNoRKah8sLIoPTFuVtZPsjA3POK8r3l+OVSIGMShcfWyiFpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8s128rn; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8s128rn"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cae134bdc8so16406545ad.3
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2026 07:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783348265; x=1783953065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ynAASN/UWzfxTQNGbtwhIlwR73V0JB4yYjP/huaKh6s=;
        b=V8s128rnYinTm9Av2p7kHikAa6c2Ws8Oab+FIHYuJG+2xUqoSPcqkyk1ws91dciNnM
         oP3TtxekAD8NQNzBu7C3bBnJ3a2jvGM55qE+GbAB8YL2Qcc9CBevA5rTZDkt4X1NyAUo
         +67BehqCsiC49JAM7XetOAbil7dzeXk0vc4EptfvwaSbxmhZC5orSupsBxxfzplywQgv
         orrJTsn2Ec/Uz6JVOReWZpZICUwXhOJQ0F9cMYSgtholYJFPBiMI3JCHDK+IAxAt/h/+
         t7/R/B8v+0OVosSmzQ/pxpVh5c7ERJEZHdlh5IaZsHiZH9OgtZb0k0Od0niBzPoOhl4f
         H0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783348265; x=1783953065;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ynAASN/UWzfxTQNGbtwhIlwR73V0JB4yYjP/huaKh6s=;
        b=XwhfaUw4Dl1RJDrZcnw2sS9h4JvONMnHpwpOzI5XZgNu17rpQ6lErIrvPqaWjNky1P
         Y0ytsjoAXFAhK645tbDN+5VAtsGfK6sdo1wFSkroqIReONQqqBI+/7/eEkV6puGeng8p
         GC7J0v83KjHe9NPTSk1ia8XVSr5ZgiT1D+FSX+1suK8oQwTIsIMNAErjQ5dbYCdFn9Hj
         ulE5+aFg7cLvetKE0suLC3JGyIVMHJPHKKH40nLXclvOIBhBgjFwh6hXpov+IIEXJDTr
         LFzGrJ3Lhf4k/rwb5JEaQrTx6zp5nL7M7avB+IdhVDMwHvlAxl/kD/MVPnT2X+3Epn9k
         Mn+Q==
X-Forwarded-Encrypted: i=1; AHgh+RrzJ21OYgoUNikwjpFATU9XCFTloUbrFoUjvjgdIDU13k5YKEZr4adZgRsRWY1xNn7zzquN2B7FNX0qhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYFnQVolKA4iTEFpLldGDe7HTYPcZf91TGYoolF5l7To9i6kwU
	mbU4fJMxa5m9P2daUItQhVijG9KqukcMF0N8AKjxt/M/woJVN1gpRpfy
X-Gm-Gg: AfdE7cnS4h16y9S0EpGr1viePqUXo7g6PrtZxlHczCT0vP6TSY1JXH2e1ymbsn9NAJa
	GGmsI3emNbRGptaZ+YqsSdSBSsTBdxEPZodN7j744LqsS9bDcOegEURxJ44jK9xnInVuz/QABkN
	4X0BETM5GoMhkXoYC/oWTmeZbtBnUbgC1MUNVdftWIOMPyR/eAkEqOV6MPuEPWuxYu8DjdLfOIh
	BH8kIgKQJ1ZQ6L3cWyVBUNbQIqd3O09W8eeTJJtY55G3/lb4l2wRFfWW8iho7EB/Az09HE6nPGu
	ivPlvhHNWGd/o4rEv23UvDQdSqAP/WTxS7vwhk/2rsHx/TkKUMuq78KLbDMuiNXnA8j03sPKo4d
	1FPoHJlEObkMGHDjCniY/j4/IB/r1KSTGOeYwUgZBY6hFrWyjiVhzqDUcxUJ27XSfve2OMgNOQ7
	FXU5JzhlruB4jx5AZGyThn1MMx7vVdQEny3DqcfSYE4wR39bboWfjqmsPzQDQR7A==
X-Received: by 2002:a05:6a20:a111:b0:3bf:7498:9cd1 with SMTP id adf61e73a8af0-3c08eeb269bmr1062420637.45.1783348264863;
        Mon, 06 Jul 2026 07:31:04 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e927a1152sm6269993a12.29.2026.07.06.07.31.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 07:31:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7f42fcab-5139-45bb-a344-1ef249aae6f2@roeck-us.net>
Date: Mon, 6 Jul 2026 07:31:02 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: occ: validate poll response sensor blocks
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Sanman Pradhan <psanman@juniper.net>, Arnd Bergmann <arnd@arndb.de>,
 Runyu Xiao <runyu.xiao@seu.edu.cn>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260706093317.80867-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260706093317.80867-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/6/26 02:33, Pengpeng Hou wrote:
> The OCC poll response parser walks a counted list of sensor data blocks.
> It used the static response buffer size as the parse boundary, but the
> transport only guarantees the bytes declared by the current response
> length. A malformed or truncated response can therefore make the parser
> read a block header or block payload beyond the current response data.
> 
> Use the response data_length as the parent boundary for the poll payload.
> Reject responses that cannot contain the fixed poll header, prove that
> each sensor block header is present before reading its item fields, and
> then prove that the complete block fits before advancing to the next
> block.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>   drivers/hwmon/occ/common.c | 32 +++++++++++++++++++++++++-------
>   1 file changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index e18e80e832fd..fa92ae6ec4f0 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -1052,9 +1052,10 @@ static int occ_setup_sensor_attrs(struct occ *occ)
>   }
>   
>   /* only need to do this once at startup, as OCC won't change sensors on us */
> -static void occ_parse_poll_response(struct occ *occ)
> +static int occ_parse_poll_response(struct occ *occ)
>   {
>   	unsigned int i, old_offset, offset = 0, size = 0;
> +	u16 data_length;
>   	struct occ_sensor *sensor;
>   	struct occ_sensors *sensors = &occ->sensors;
>   	struct occ_response *resp = &occ->resp;
> @@ -1063,21 +1064,34 @@ static void occ_parse_poll_response(struct occ *occ)
>   	struct occ_poll_response_header *header = &poll->header;
>   	struct occ_sensor_data_block *block = &poll->block;
>   
> +	data_length = get_unaligned_be16(&resp->data_length);
> +	if (data_length < sizeof(*header) || data_length > OCC_RESP_DATA_BYTES) {
> +		dev_warn(occ->bus_dev, "invalid OCC poll response length %u\n",
> +			 data_length);

The warning messages in this function now result in aborting the registration
and thus need to be converted to dev_err().

Thanks,
Guenter

