Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871734;
	b=WXsMb0Uo9v1icY9ChrgjFzdh8O8cxaOxHDGbn6CdeuXpJQfsat0swKlxq3XLvsttvLpV
	 ksNMDxdnYfxPYPv+/tU4s4qoaUFK37rC5T4hL+ofBQIfY0tQUmvTW7gqecu3VF4gfh8xp
	 74y0qrFvU7Kw1oKxmr5cL6rB4DmwoxlFgV/ZH5P9FfnL8W9jRVY3okHWxk+nBGM2ZTL6N
	 QBuZd2khgOg1pBRw14SOJ587XtNaRJeZ5QQgQous++qt3GA8FAM/v07ldHbiMhOSlfHCP
	 8U6lBs8DM06693g0WQpZfJnf5W08c3vb35UmAzHK61QV1smkBSFN7AicjPogrClco/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871734;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=jT+nFbbbICr5th8b0GHn8t2MdZptvraXYbkJi9qIlN0=;
	b=ZMq7NCa6Wyq/cubKXDKaGwQeBLSVxmaxbqWqZIws9fzRTg96htKl+F4saJOAR/AwmjEo
	 temOE7prGq0VNuU6L7rka0tkOTyDB91yJwWTMc8Wyk7KvmS/MMM0QNhVZOR3o5F/3XoNz
	 nQk2TgQsv2Ug26eylgu+5wpQON/ZIvSuo/nF2IzfiDxXrmRH2sppU52G4gsBzrDHDybuO
	 DCcgjEJNdUhlNseX6zydYIKPoM6mtqw/jyR/pk3vhcYKerr8Px9c1fuCAReL9Z/oeYMN5
	 NPjMXtYHyIym4fIGwx/WwxSpud9rCqaiDw++9EV43FVqWCXpgOJZ8nsQq+EdK/hWeUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MqRQfYVu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BBB606A32D;
	Thu,  5 Nov 2026 09:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MqRQfYVu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD1651F000C1;
	Thu,  5 Nov 2026 09:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793871734;
	bh=jT+nFbbbICr5th8b0GHn8t2MdZptvraXYbkJi9qIlN0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=MqRQfYVumsV0QgmG3NWXwkdukuGy08Pqxr/ysS+GQVRfn02zAaUSkIwSOIF9ERUI1
	 XEvSBYeYKv8G2tku14SF/5/M9CBhZTFG0BPnlcDktFrNT8W7aYTY4nwWxnvqU4XzbP
	 fSF82MZapzpWy9HDm9G1754d+p+gN02QewdLrNYfGqzOeEtCWp0rZdZgMrE0bbXH1L
	 Qol6Hc+lHqXBkZ/7biROOvoZdO+kqRmrB0zF8DNZdr9glscohsxKi4GFS/R1pTjKSY
	 1AjDQBOliZYQUjZnUJfv7KDzkOkRLn9YdGutT00LmYKe5wQusX3Ri829UwOpOZil3H
	 NARHUYoESsFsg==
Message-ID: <021df228-5e40-4295-b6e3-328a2128af0a@kernel.org>
Date: Thu, 5 Nov 2026 10:42:10 +0100
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] devres: add managed timer shutdown helper
To: Guenter Roeck <linux@roeck-us.net>,
 Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <CADZg-m3Mnk_QJ44HrH4SkCm+pN5QteeQv8zY9Q7EE7RQv65O8A@mail.gmail.com>
 <6d490e67-82a2-44b0-be16-3aa46e7c0430@roeck-us.net>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <6d490e67-82a2-44b0-be16-3aa46e7c0430@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5-Nov-26 12:23 AM, Guenter Roeck wrote:
> On 11/4/26 15:03, Kirtikumar Anandrao Ramchandani wrote:
>> Provide a devres action for initialized timers. The action calls
>> timer_shutdown_sync(), draining the callback and rejecting later rearming
>> before device-managed storage is released.
>>
>> Use devm_add_action_or_reset() so a failed action registration shuts the
>> timer down immediately.
>>
>> Signed-off-by: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>
> 
> I see no benefit in this patch. The calling code now calls
> devm_timer_autoshutdown() instead of devm_add_action_or_reset().
> That does not really make a difference. Sure, we could add similar
> code for every instance of devm_add_action_or_reset() in the kernel,
> but what would be the point ?

I agree.

If you do this, this should be a replacement for timer_setup()
which then does the setup + adds the automatic shutdown-sync on dev
resource cleanup.

Similar to how include/linux/devm-helpers.h has devm_work_autocancel()
which calls INIT_WORK(w, worker) and sets-up a cancel_work_sync()
call on dev resource cleanup.

Regards,

Hans



>> ---
>>   include/linux/devm-helpers.h | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/include/linux/devm-helpers.h b/include/linux/devm-helpers.h
>> index 708ca9131..ffe8b68b7 100644
>> --- a/include/linux/devm-helpers.h
>> +++ b/include/linux/devm-helpers.h
>> @@ -24,8 +24,33 @@
>>    */
>>
>>   #include <linux/device.h>
>> +#include <linux/timer.h>
>>   #include <linux/workqueue.h>
>>
>> +static inline void devm_timer_shutdown(void *res)
>> +{
>> +    timer_shutdown_sync(res);
>> +}
>> +
>> +/**
>> + * devm_timer_autoshutdown - Shut down an initialized timer on resource release
>> + * @dev: Device whose lifetime the timer is bound to
>> + * @timer: Initialized timer to shut down
>> + *
>> + * Register a timer_shutdown_sync() action. Register this action before
>> + * arming the timer, and after resources that its callback may access.
>> + * The timer is shut down immediately if action registration fails.
>> + *
>> + * The callback's resources must remain live until shutdown completes. Any
>> + * independent user of the timer must stop before the timer's storage is
>> + * released. Devres actions run in reverse registration order.
>> + */
>> +static inline int devm_timer_autoshutdown(struct device *dev,
>> +                      struct timer_list *timer)
>> +{
>> +    return devm_add_action_or_reset(dev, devm_timer_shutdown, timer);
>> +}
>> +
>>   static inline void devm_delayed_work_drop(void *res)
>>   {
>>       cancel_delayed_work_sync(res);
> 

