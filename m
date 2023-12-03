Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="JENUHg+x"
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr [80.12.242.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39BF9ED
	for <linux-hwmon@vger.kernel.org>; Sun,  3 Dec 2023 07:26:07 -0800 (PST)
Received: from [192.168.1.18] ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id 9oM6rdpxsFU7r9oM6rRcHp; Sun, 03 Dec 2023 16:26:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1701617165;
	bh=z4+LCeotKhKAPKowkUt28WTuHMog6jIptBmCHVjylLU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=JENUHg+xMkY+68I+254ksHx8nw21VSEVU1B0VBuPg/havST9ddSIRBFhEOmAnT0tP
	 v1exUHShDMFAaoIqqE5cJSfoPcfF6c2nq4ClwUMX7vaagnZMDlNvePRKdfBhDFhxyC
	 rhibZGktwky3IMxcvUA3JO6whBWp+IWABlFv8FKoTB3YiroSqgYv4AmI4s+JLsJ8Mq
	 A3z4skBbzbdUlyBm0EOPOny3z7bZn/AjsjYTw11hZHHm2bSjZJpeO/4TXwQh8M5KY/
	 3uCoVDQpGvQ0YtZR7NXJQulULRC/WSE+wuD5Z9AgLyWN8Kx8GSXGTbzGXeL84HRKP3
	 cEy0FvIlvN7+Q==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 03 Dec 2023 16:26:05 +0100
X-ME-IP: 92.140.202.140
Message-ID: <5404194d-9ee6-4def-a040-f5858d8c2d66@wanadoo.fr>
Date: Sun, 3 Dec 2023 16:26:02 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: Add driver for Gigabyte AORUS Waterforce AIO
 coolers
Content-Language: fr
To: Aleksa Savic <savicaleksa83@gmail.com>, linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20231203120651.371429-1-savicaleksa83@gmail.com>
 <2a89f0b4-990a-4d0d-8e54-c4215579c23c@wanadoo.fr>
 <121470f0-6c1f-418a-844c-7ec2e8a54b8e@gmail.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <121470f0-6c1f-418a-844c-7ec2e8a54b8e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 03/12/2023 à 16:00, Aleksa Savic a écrit :
>>> +static int waterforce_probe(struct hid_device *hdev, const struct hid_device_id *id)
>>> +{
>>> +    struct waterforce_data *priv;
>>> +    int ret;
>>> +
>>> +    priv = devm_kzalloc(&hdev->dev, sizeof(*priv), GFP_KERNEL);
>>> +    if (!priv)
>>> +        return -ENOMEM;
>>> +
>>> +    priv->hdev = hdev;
>>> +    hid_set_drvdata(hdev, priv);
>>> +
>>> +    /*
>>> +     * Initialize priv->updated to STATUS_VALIDITY seconds in the past, making
>>> +     * the initial empty data invalid for waterforce_read() without the need for
>>> +     * a special case there.
>>> +     */
>>> +    priv->updated = jiffies - msecs_to_jiffies(STATUS_VALIDITY);
>>> +
>>> +    ret = hid_parse(hdev);
>>> +    if (ret) {
>>> +        hid_err(hdev, "hid parse failed with %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    /*
>>> +     * Enable hidraw so existing user-space tools can continue to work.
>>> +     */
>>> +    ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
>>> +    if (ret) {
>>> +        hid_err(hdev, "hid hw start failed with %d\n", ret);
>>> +        goto fail_and_stop;
>>
>> Should this be 'return ret;' (the _start has failed, so why stop?)
> 
> Hm, yes.
> 
>>
>>> +    }
>>> +
>>> +    ret = hid_hw_open(hdev);
>>> +    if (ret) {
>>> +        hid_err(hdev, "hid hw open failed with %d\n", ret);
>>> +        goto fail_and_close;
>>
>> Should this be 'fail_and_stop' (the _open has failed, so why close?)
> 
> Also yes... I based this part on the nzxt-kraken2 driver in the tree,
> perhaps that should be investigated as well. The aquacomputer_d5next driver
> seems to be doing it correctly.

Done, patch sent.

CH

