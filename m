Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD9323497C;
	Tue, 14 Jan 2025 07:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736840696; cv=none; b=XSNjQLJPUCZyZ0jvYqCR1Y83eu+V7s5xYFMK43Z5s3S+W7Fo58E+dpQ3clg9ODjtwosMliOLS4g/pIffUy0piwuro/HaoLt/+GZ+Mxz1MfVRWZhydP+hLf3ZsE6kIJQRnWbkAy9NEiVsi70LsiIjplEI2fG/safmcijUbJ5mtQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736840696; c=relaxed/simple;
	bh=GDNBLAxGeO0PWoIieCqf8RcK1yonZrihG0cI7M1i3No=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B60MU91qYWWllQe15WjwiMf7TOPO8nyYgKDev6tBnkOv9zgwkyCoQBNaNTe7UigmQe/x5xo1KiEjqmvZExpIjkA91InQW9skpYhJQ8AlN9IhzYVC26Z/+NtSyTlfOLWvjhTYGD0ZTe/pSn5zB8y34WWVpjsFFOqoW+Htwxd+bmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=UVRbURFn; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="UVRbURFn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=wvbou
	lY3Ry/VAOl+g+8j0k12mwgX0pcrL6wahxEE9cw=; b=UVRbURFnP/JR9g03KYWht
	KuQx2gcqpa+QxxvqEQh/rwFyOH7fF5LR2bLj0lIuFuhNZ0EUho4ed2C6FRlfJeeW
	T8CCz9nVZTeHk3GDZ+3PAn9w4mtzfq0wMYaXKnrGSQ0Bta+In0ve2cu2egjBwlg6
	vejsbeIwE57LCJnTGEj3aM=
Received: from silergy-System-Product-Name.silergy.inc (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDHj4esFYZn97tZGA--.26807S4;
	Tue, 14 Jan 2025 15:43:42 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: conor@kernel.org
Cc: conor+dt@kernel.org,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	jdelvare@suse.com,
	krzk+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	robh@kernel.org,
	wenliang202407@163.com
Subject: Re: [PATCH v2 2/2] hwmon:(ina238)Add support for SQ52206
Date: Tue, 14 Jan 2025 15:43:37 +0800
Message-ID: <20250114074337.458936-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250113-unmoving-drinking-eced6d36979e@spud>
References: <20250113-unmoving-drinking-eced6d36979e@spud>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHj4esFYZn97tZGA--.26807S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyxurWrtw1DXrW5Zr1kXwb_yoW8XFW7pr
	WfCF1DtF9Yqw13W3yUtF1F93WUZw1kAa18KF1DtF1jgF1vg3WSq39IgrnY9FnrAr93ZFy3
	WFyvgr4kt3yUAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUZVyxUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbiow-T02eFUqDI-gABsL


At 2025-01-14 01:12:32, "Conor Dooley" <conor@kernel.org> wrote:
>On Mon, Jan 13, 2025 at 11:50:22AM +0800, Wenliang Yan wrote:
>> Add the sq52206 compatible to the ina2xx.yaml
>> 
>> Signed-off-by: Wenliang Yan <wenliang202407@163.com>
>> ---
>> 
>> The new features added to sq52206 compared to ina238 do not
>> affect the differences in hardware properties.The properties
>> described in the ina2xx.yaml are applicable to the sq52206.
>
>This blurb is a bit confusing, as it makes it seem like the devices are
>compatible. The driver patch, however, suggests otherwise. Please
>mention in your commit message what differs between the new device
>you're adding and existing ones.
>

Sorry for not mentioning their differences.

sq52206 has a difference, the shunt gain value 1 is mapped to
ADCRANGE=10/11, the value 2 is mapped to ADCRANGE=01, and the value 2 is
mapped to ADCRANGE=00.

>> 
>>  Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
>> index 05a9cb36cd82..f0b7758ab29f 100644
>> --- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
>> +++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
>> @@ -20,6 +20,7 @@ description: |
>>  properties:
>>    compatible:
>>      enum:
>> +      - silergy,sq52206
>>        - silergy,sy24655
>>        - ti,ina209
>>        - ti,ina219
>> -- 
>> 2.43.0
>> 

Thanks,
Wenliang Yan

