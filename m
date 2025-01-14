Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8040624022D;
	Tue, 14 Jan 2025 07:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736840779; cv=none; b=ZVWTRMsEOLtCfGRtp+UiPwyHw0bNt+RpIHcovnGZyVhyCc2BElRqNtBN1K20d/bP3pBpEdE9bIYSgS3mvhOFI4OLFv4FOCQr2hbl7kpxYPpZnXFEl6I9m1DAN5PGCVSJ6cdg1Gzn8YcNC2sej6qGTiD7Vxih1iSE7IJrppoddm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736840779; c=relaxed/simple;
	bh=Tu/eWFxP0mg3TChLjg2XpBGf47bZ9AbxqFBtsHNDDQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KUA+HZJPaT3iA+2icHfxLQD8g3ErnchwvUSj1SKEJoTxRoA8GlhNqDVSXbAP6kyUZ4UxZ+wrMV5/mLqRyFviVkSItlojtR8YdpySuRqxbq+6aQDOZZNrBPtJEHLyo49/tVy1FacgpMcucSmQv+HYjjWSGaVjeZxKBFl6kqH8b1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=YX/7SJuD; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="YX/7SJuD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=cgsas
	uL8dVhh35K82yXkgE96w5xOQCtI/r4MmY02OA8=; b=YX/7SJuDLW2y6ZbJsOCj0
	RMO51o0qZ6cyyF7gyrdEBy5K2SXoiW4ML27wF/5vp1hwQszsDKfvMMhEGOIetfuG
	YRz5PaoJX3gfqbUfCVbEkRB3BRN/lcJJfoP949NG5CPBO4ireZOthEdCnptqzWdt
	FFY5MViuno8va1p1mxiK24=
Received: from silergy-System-Product-Name.silergy.inc (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnd3__FYZnfuAOFw--.30224S4;
	Tue, 14 Jan 2025 15:45:04 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: linux@roeck-us.net
Cc: conor+dt@kernel.org,
	corbet@lwn.net,
	jdelvare@suse.com,
	krzk+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	wenliang202407@163.com
Subject: Re: [PATCH v2 2/2] hwmon:(ina238)Add support for SQ52206
Date: Tue, 14 Jan 2025 15:44:32 +0800
Message-ID: <20250114074432.458988-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <c7c3503f-526e-41f3-8b82-ba7c7c68e89e@roeck-us.net>
References: <c7c3503f-526e-41f3-8b82-ba7c7c68e89e@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnd3__FYZnfuAOFw--.30224S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrykAr1xWFyfKry5Kr4DArb_yoW5JF4fpF
	WrGa1rGF4UJanxKr4IyrWruF18tws7Gry7Gr10gw1kZFyDGr9a9F4DKF4rt3W2krZ5Zr4F
	vay0qayakrnrtFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JU6E__UUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbioxjU02eGDTuxjAAAsW

At 2025-01-14 01:45:48, "Guenter Roeck" <linux@roeck-us.net> wrote:
>On Mon, Jan 13, 2025 at 11:50:23AM +0800, Wenliang Yan wrote:
>> Add support for SQ52206 to the Ina238 driver. Add registers,
>> add calculation formulas, increase compatibility, add
>> compatibility programs for multiple chips.
>> 
>> Signed-off-by: Wenliang Yan <wenliang202407@163.com>
>> ---
>...
>> @@ -452,6 +554,9 @@ static umode_t ina238_is_visible(const void *drvdata,
>>  				 enum hwmon_sensor_types type,
>>  				 u32 attr, int channel)
>>  {
>> +	const struct ina238_data *data = drvdata;
>> +	bool has_power_highest = data->config->has_power_highest;
>> +
>>  	switch (type) {
>>  	case hwmon_in:
>>  		switch (attr) {
>> @@ -479,6 +584,10 @@ static umode_t ina238_is_visible(const void *drvdata,
>>  			return 0444;
>>  		case hwmon_power_max:
>>  			return 0644;
>> +		case hwmon_power_input_highest:
>> +			if (has_power_highest)
>> +				return 0444;
>> +			break;
>
>This doesn't work as intended. The break; results in the code
>entering the hwmon_temp: case. It has to be "return 0;" or
>the entire function needs to be rewritten to use "break;"
>to exit the switch statements, and "return 0;" at the end
>of the function.
>

Yes, I made a mistake with the nested hierarchy. I will change
'break' to 'return 0'

>>  static int ina238_probe(struct i2c_client *client)
>>  {
>...
>> -	if (data->gain == 1)
>> +	config = data->config->config_default;
>> +	if (chip == sq52206)
>> +		if (data->gain == 1)
>> +			config |= SQ52206_CONFIG_ADCRANGE_HIGH; /* ADCRANGE = 10/11 is /1 */
>> +		else if (data->gain == 2)
>> +			config |= SQ52206_CONFIG_ADCRANGE_LOW; /* ADCRANGE = 01 is /2 */
>> +	else if (data->gain == 1)
>
>The "else" here is the else from "if (data->gain == 2)" which is wrong.
>The entire if/else block from "if (chip == sq52206)" needs to be in {}
>to avoid that.
>

Agree.

>>  		config |= INA238_CONFIG_ADCRANGE; /* ADCRANGE = 1 is /1 */
>>  	ret = regmap_write(data->regmap, INA238_CONFIG, config);
>>  	if (ret < 0) {
>> @@ -605,7 +735,8 @@ static int ina238_probe(struct i2c_client *client)
>>  
>>  	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
>>  							 &ina238_chip_info,
>> -							 NULL);
>> +							 data->config->has_energy ?
>> +								NULL : ina238_groups);
>
>This seems to be wrong check. I would assume that ina238_groups is passed
>if data->config->has_energy is true, not if it is false.
>

Yes, the logic here is reversed. Should exchange NULL and ina238_groups.

>Guenter

Thanks,
Wenliang Yan

