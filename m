Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DA4371D16
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Jun 2026 19:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782242553; cv=none; b=iF9+GS28HKoNbECXV2eS2RHfzfIJy0Jgjdx7OwMvpiX28hljEp8pp9hFi1DFwo9caGSO6XxX1g6dh/Por3VFBQVxWE5mPgTfgPRZvAALcwXpsW6XNg6Bf8TlboqBfd5q9i8Nv3ZQo4gEZDnpKkjRAnSjRGtiuk34xcLGUg2wwRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782242553; c=relaxed/simple;
	bh=gjgrsDd/ebzWh6tkakuHrLUHkTjwUYhdEmKlxZWsS1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SXZX11yyFa8mNYH7bBNGM5+dqba0lO7zLF2snaU8n/lXwnOqSA/G2ZGmGt7qEAX6xMfq1iUxfKaG3Z8EDvR7LRnNX7iqFNy+LHtSD7rOR2PrTdmMBmhMSzWeNSX2aslWqQwU0CICuyyuWRb2cCbubpsroo8QH0ALTpI840FR+3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqtwPlXP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqtwPlXP"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b7866869so2113005e9.2
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Jun 2026 12:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782242550; x=1782847350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qRZ8hq7NweVMrKwvoIG6kF3ia46DL3ufdBurnwbak0=;
        b=EqtwPlXPZKtr5HCE+LS7ehOYqgFfuQmx68ZTv0iWX00f/f9sCPjj7oKEGSNnA/ZlNT
         zOGCjFC/Q2TKB8GC2tlYMKEii1LaAI7v048PrtSLC3pgzYsk82kh5//rj9PkYN1To8BT
         KsSJLTVOs019MPmgGkhlsdSRj6Ftva+x04VpH9pHZ375umR9z3yEYtcG213mrABKXhJg
         xn20p4ikZgerZPV1dz/ZjuGgXTKKziscB34OxZm9XJ/WO9MbSD4OZaabkE3pBW5o0QbV
         3JYlcmzAZtdzthd/3LeDfkLczhkKy7rATRVVV1eWKvCLiOJKXkXIj+bFCs73o9zV6Xgl
         YTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782242550; x=1782847350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9qRZ8hq7NweVMrKwvoIG6kF3ia46DL3ufdBurnwbak0=;
        b=YOyIi25+5Ryo4IAFe36xJxxxgHT0ltGDblQRLhOEMygXwoNK4YMUeaLfHlAWgGP5hD
         8DgcSkanVpGmtQqaON21zJUsZuL50HV3PuBqVTV89bCX8HGrFgRxtMi+tyeanGjeIvC7
         c9/fHl6g84PYs5fVILFtFOZV7MqHHpJCSnyCIgMlc7+eCrFV5I9fJEN/vnG/QB7XJdA5
         wX/td4ipr9g7jqEslDigh+GKpMfqD+Ewk3imqVVm1M4Rg9/U4I+f8orIiiOqoG9q9eWu
         nnVOC6BmSaAqrTw1QrbpZIBdAVyqzjNm6vPmdw2krxXInuZGD5uQaaCXvZEa0mXx63G7
         ng1Q==
X-Forwarded-Encrypted: i=1; AFNElJ9g89rnfdUp+Oc5GkE7i/jIit8OCa0LNIlmLSxKl4cLcQ//ecEkzTzgjSNAUg12oWgmHR2ez8ESGwuv3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDYGaskP3gamg0VY/S4MTT1J4gO67DuMEgmjynBB3NaMazH7xK
	qK16YE0P/HPN7Z6FQVqtUE0av3u1LZPdeVeXuARrFpxUpC1D2SEqvz4F
X-Gm-Gg: AfdE7cku6Y1kUqwHAA52cPzUP3NuHDdber45MeyQHeWOP4SsCNsT+m+Zmc22pJ5buxF
	3/SCa3gZqIWPiQQL/kKHSGNo5YSw2ltN3Ae8xzX3+acWJsvMiUH6Ok/80ganUrr/QUDQYy8p/f+
	gUCHOC4/5E1ck0Hn/eM5vTqOG2J+DLCqv1jWgGlBV7k/c1eeAxoxzC1Jx4UhLAztZf5EWQvec9W
	Rzg3JxFJ93gxEcRcBAWUcDlTme2BT+axsmn6h/fQMseSguIvGaMnWbhh0M7S5rvihrIezCQiEG2
	MmPUz91ICRdW7R/IjDbCRAo7XV4j8kELLi8kSCo7Wrg+D9tz1xeQwHV5z4SJ1nfCYg00BN5msZv
	bFlXTFK6MC4DPr90SF9mwVhUyZrsaKZKYb+lamDCSQHsOTjPdyQCzcA1ZKF5prvZ0uFDNZ7sPth
	lpdOQsD1Cvlor2UllXmFsdCWaRO3IlPPIHr3MvCcWdLEdxIC35fsmx51VKJp8/h046rhLeoqJc
X-Received: by 2002:a05:600c:6812:b0:490:5466:8591 with SMTP id 5b1f17b1804b1-4925b353633mr62488105e9.12.1782242550328;
        Tue, 23 Jun 2026 12:22:30 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.86.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49249238bfbsm335967985e9.5.2026.06.23.12.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 12:22:29 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
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
Date: Tue, 23 Jun 2026 22:22:17 +0300
Message-ID: <20260623192217.4804-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <b6d34af3-0c4a-4870-a240-f7873621d2ce@roeck-us.net>
References: <b6d34af3-0c4a-4870-a240-f7873621d2ce@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 6/23/26 9:58 PM CET, Guenter Roeck wrote:
>On 6/23/26 11:16, Flaviu Nistor wrote:
>> On Mon Jun 22, 2026 at 7:29 PM CEST, Javier Carrasco wrote:
>>> On Mon Jun 22, 2026 at 2:21 PM CEST, Flaviu Nistor wrote:
>>>> Add support for an optional label property similar to other hwmon devices
>>>> This allows, in case of boards with multiple CHIPCAP2 sensors, to assign
>>>> distinct names to each instance.
>>>>
>>>> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
>>>> ---
>>>>   .../devicetree/bindings/hwmon/amphenol,chipcap2.yaml         | 5 +++++
>>>>   1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.ya=
>>> ml b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
>>>> index 17351fdbefce..f00b5a4b14dd 100644
>>>> --- a/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
>>>> +++ b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
>>>> @@ -33,6 +33,10 @@ properties:
>>>>     reg:
>>>>       maxItems: 1
>>>>
>>>> +  label:
>>>> +    description:
>>>> +      A descriptive name for this channel, like "ambient" or "psu".
>>>> +
>>>>     interrupts:
>>>>       items:
>>>>         - description: measurement ready indicator
>>>> @@ -72,6 +76,7 @@ examples:
>>>>                            <5 IRQ_TYPE_EDGE_RISING>,
>>>>                            <6 IRQ_TYPE_EDGE_RISING>;
>>>>               interrupt-names =3D "ready", "low", "high";
>>>> +            label =3D "somelabel";
>>>>               vdd-supply =3D <&reg_vdd>;
>>>>           };
>>>       };
>>>
>>> Hello Falviu, thank you for your patch.
>>>
>>
>> Hello Javier, thanks for your reply.
>>
>>> Should we not add a reference to hwmon-common.yaml (with
>>> unevelautedProperties instead of additionalProperties), as label is
>>> defined there? I believe that Krzysztof Kozlowski did something similar
>>> for the shunt-resistor-micro-ohms property. Could we follow suit here?
>>>
>>
>> This is a good question and I am happy you asked. I also thought a lot
>> about this and the reason I decided to go for this approach is that by using
>> $ref: hwmon-common.yaml#, I would have to change additionalProperties: false
>> to unevaluatedProperties: false, which will evaluate in case it is used, also
>> shunt-resistor-micro-ohms property which does not apply to this sensor. At
>> least this is my understanding, but of course I can be wrong (I see lm75 binding
>> also uses $ref: hwmon-common.yaml# but shunt-resistor-micro-ohms does not apply).
>>
>
>Where does the idea come from that shunt-resistor-micro-ohms would be mandatory ?
>That would make hwmon-common.yaml unusable for most chips.

I think this is a misunderstanding since I never had the intention to imply that
shunt-resistor-micro-ohms would be mandatory, but rather I observed that if I used
$ref: hwmon-common.yaml#, property shunt-resistor-micro-ohms can be added (no need to,
but still possible) in the example section and the dt_binding_check will pass.
Since hwmon-common.yaml is already there I will change the binding in a v2 and use it.

Best regards,
Flaviu
