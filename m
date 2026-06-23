Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEB2392C2C
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Jun 2026 18:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782238601; cv=none; b=Bv7N/djaNDKQbCKrqBK8Pyq19Fr9AhbwOUzkABBCqNzmEB4dKBM/D4fKrqznlYSlWI8S99MB7AeaDNfMsC6fpv48sGS+9Q/QIgwe3GhYM4UtYy5gnr64GbJavClWEmefkFIpXXUv9BloAzLou2C7HRc7reBkqQ1TOkGLwEAA8MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782238601; c=relaxed/simple;
	bh=v/Jq4x0ikLZAY+sHdmkdAGe7Bx11aQjbFFTuibl2AI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MqJD/r0+8RlIK0lX/9KeBgtD8NNwOV6qBBQE8Xg0GOeyYnaoJEIRoR/7S8AS4t0S4gWrt0Sr+H2baYqKsH1h2ShffgY3iTHtdNBQSWJm5NmxVS6danlPaH3RzaLTzt2EeF6v3wDfC07Q2js3K1ECVQEd+G3PvSwPUgoYJJQ+wac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jme5FcVy; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jme5FcVy"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45fd461e4a5so167525f8f.0
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Jun 2026 11:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782238598; x=1782843398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hp0RP7mlwmSy+hW/y528ewOP23RYH5LVdeU7dyCxrV0=;
        b=Jme5FcVyZF6oWSwNaRx3F8qjTqms6v8jOKHEdxBgcFjVZMWaaYCqb0QZbNBlk0e5tI
         qxiz83JYkH477dxLKgLqudS8J1rlDNs/Bkb8pgTCWHBz86Jx+K/cBAKU2qZuplAN0IBK
         sUXLD5u9Mp/6C8ZLn5KPpBZpkWI/fzrPq3RfNEq6C6JT9R/VozG19rqfshMohcCVxswQ
         cPvqTsTIRPvN0MHhKOv7KV0FBMIM7uBYLQFGc3t9VWKvgqESQ7C0ykKfDHdxnmPpIj5w
         3Q3IXmY8WmTn8Ll0jq++m0dIE4HiaKb5G+DYWPvwMEiAwjTkvHp0z47VpOkOc9DQVD4n
         cajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782238598; x=1782843398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hp0RP7mlwmSy+hW/y528ewOP23RYH5LVdeU7dyCxrV0=;
        b=j2Fa9ThD5iaI8pzQJwPnvAPn8zPXFLCLL/IEO/vJw3Z6Q6rJyZW28dzqKdk22Bql4r
         PUZ7TgwFWDyYAidU5+ozmic6aYhxQ9MITlspKCVoQediBjYb0BAEDwzbSSN2s6sKX1dt
         XoTCPPb6dncKg6TgBZDQTGBqV3v9W6PTNayFBSEjqqksgSK1fi7vx5K4vFsfX+sFvuUJ
         gbBU3wfhhEbEpSyAMF15ZDxg/vTCfMbNHFIIHAzyQ6ywOXpluN0pgDaCzuaMzcB0ym9E
         xpdC0Vqry77csni+QMPzQ35zYwxgw8LwGwN/CnNnupPcsLR1vH5q52Dri49klSvtMYIO
         ubNQ==
X-Forwarded-Encrypted: i=1; AHgh+RoAv5Xpnis4Qin31Wy5FR2AzZi6j379U64rXKA8XT3710Wflk5amupWxDewudjUNcap9dGjjV0J8bap4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yygj6SwkibTRPKbsh3hm8VUJzjjVGulACT8fZ1mK3I/kZbCVy6U
	qb1i+6QwzaHUyTk/A1W1TBc04ws9HcHxvyEwE9b6mvGPIx3zwCZJpZpVmQVfO/nn
X-Gm-Gg: AfdE7cmBzq0o1mOKRYN58lbtdmQl6Xo1qgB9J3ESseZ0XzU4XWd1mhiD+HQwlIqnlX9
	hzNzDq8PwyYUTmY6xVJMMn628zi5KyI41QJcGollTc642whDgjEWhIJmgbjg8xoUPq9d8YNhPXN
	81kEVQCxJngFiMkwnES2G1m67vsCsy/17th48VirUDi3y7+iPHVzvB6WbE+9KXDcrLtrIGvJkoC
	sjGmZNWTYAnZ6mHJ0soZTrcjvJ2mMutSzwLTq9MXDDd2o0GISFRErclhsGxqbKfWk5np3BGxemY
	4ZxUiGnw/uom+f8eTSZUg7s0ZGfm23O/qbHaXFcZCVymKHA4X5wyPWmuTp82sUDKPJ98DGAFNLs
	1ZxzxiELLEZvQKLBXysNWjNHXdkOqqv20K8O0PH/Db9Qz22kflC7rFm/y3ZLaXk1kM4K0Gou5qK
	j1XBwp80eUQAyFSWFlVmUCKzn9gge83m6XNoVrvvE+57+4XgefAXCqCWXpcOplJh/It6LbIEQt
X-Received: by 2002:a05:6000:2004:b0:45e:dacb:8885 with SMTP id ffacd0b85a97d-46adb0b697emr6229006f8f.35.1782238598308;
        Tue, 23 Jun 2026 11:16:38 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.86.252])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666c57b8asm38433933f8f.26.2026.06.23.11.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 11:16:37 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re:[PATCH 1/2] dt-bindings: hwmon: chipcap2: Add label property
Date: Tue, 23 Jun 2026 21:16:25 +0300
Message-ID: <20260623181625.5697-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DJFPYCV2FXW7.1BFG9DURPZRCC@gmail.com>
References: <DJFPYCV2FXW7.1BFG9DURPZRCC@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon Jun 22, 2026 at 7:29 PM CEST, Javier Carrasco wrote:
>On Mon Jun 22, 2026 at 2:21 PM CEST, Flaviu Nistor wrote:
>> Add support for an optional label property similar to other hwmon devices
>> This allows, in case of boards with multiple CHIPCAP2 sensors, to assign
>> distinct names to each instance.
>>
>> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
>> ---
>>  .../devicetree/bindings/hwmon/amphenol,chipcap2.yaml         | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.ya=
>ml b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
>> index 17351fdbefce..f00b5a4b14dd 100644
>> --- a/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
>> +++ b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
>> @@ -33,6 +33,10 @@ properties:
>>    reg:
>>      maxItems: 1
>>
>> +  label:
>> +    description:
>> +      A descriptive name for this channel, like "ambient" or "psu".
>> +
>>    interrupts:
>>      items:
>>        - description: measurement ready indicator
>> @@ -72,6 +76,7 @@ examples:
>>                           <5 IRQ_TYPE_EDGE_RISING>,
>>                           <6 IRQ_TYPE_EDGE_RISING>;
>>              interrupt-names =3D "ready", "low", "high";
>> +            label =3D "somelabel";
>>              vdd-supply =3D <&reg_vdd>;
>>          };
>      };
>
>Hello Falviu, thank you for your patch.
>

Hello Javier, thanks for your reply.

>Should we not add a reference to hwmon-common.yaml (with
>unevelautedProperties instead of additionalProperties), as label is
>defined there? I believe that Krzysztof Kozlowski did something similar
>for the shunt-resistor-micro-ohms property. Could we follow suit here?
>

This is a good question and I am happy you asked. I also thought a lot
about this and the reason I decided to go for this approach is that by using
$ref: hwmon-common.yaml#, I would have to change additionalProperties: false
to unevaluatedProperties: false, which will evaluate in case it is used, also
shunt-resistor-micro-ohms property which does not apply to this sensor. At
least this is my understanding, but of course I can be wrong (I see lm75 binding
also uses $ref: hwmon-common.yaml# but shunt-resistor-micro-ohms does not apply). 

>I am also not a big fan of a name like "somelabel", and a more
>meaningful name from a "real" example would look better. I know that
>some examples have already used "somelabel" as an example, but others
>have used more meaningful names too.
>

I will have to send a v2 since for the label property description I used
"channel" instead of "sensor" (detected by Sashiko AI review), so I can
use in the example section a more meaningful name like "Room" if no other
suggestion.

>Best regards,
>Javier Carrasco

Best regards,
Flaviu Nistor
