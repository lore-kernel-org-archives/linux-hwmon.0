Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AED3AC0D4;
	Tue, 23 Jun 2026 06:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782194880; cv=none; b=bAs0ZKWijTmw4nkV5Vz6d1HHFIRhMgD8rOcGQAi/okht7pVDgPz0vO6ahln58NxZPrEpJPW4KYAYp2YBcdXk8413S8EvBOb7G2RsymYpI9FTDWvD4DvfLBAax8n9ORzDFCbUzrl6Doc9KL/tUiAzdFbMEnGXIYZ1DiDqsg9bSQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782194880; c=relaxed/simple;
	bh=WEz718Emib+Wwmernjiq1U+vsQeWIMiW+OmLIuiLKxE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ryRy/T1GKlyyiA/jdob4rb2pVCZw0TEFjB8lEx8/P8ZMEI2kyydcci0Wl2Hneb6d2MeRxzaEdk6xHtpCF1B4vxRJK+x+XGTeulcps0JUy1CQSrzK6YnJnfdcuzXRud3MrOcMO2Eahx+G8mWjLEats1mJ3nNj7x2AsvcSJasxYw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WEeMD3gO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WEeMD3gO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB311F000E9;
	Tue, 23 Jun 2026 06:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782194872;
	bh=YJa32nfU1RKJGeMJgs9TtYByggswvSMW7Ubl1R//gbw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WEeMD3gOv6m6JKHv7jp0+npiOjorfUqeK0B7EJdS5IAn+V4idwP2C7/yuP4fgmT9a
	 Q5dniErkoZ9TLlYeDoj6mzngRiIv+FyfY/xUZCzVv6BLoowsg4c3BsmSYMvgyfmLqI
	 yLOI/UeumWEhiwcCnX/ah5cIEV+3Ed342Lu52DAFias84jloTvQau8NSef/E3Lkzw/
	 7g0ziGKJ+ia1RLIKbI7xl20altEDOpoi4FZAL7ctOo2qzp1i2Esd5vS62gvCvWwW5l
	 Pe+bI4Z89gpawp7YkORsY3CEk3+Wwciueb3gwF8B+m1KPQ3NLs+U9ze70Xad7NK4f5
	 78cPoFtYsD5vg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] hwmon: (pmbus/fd5121): Add support FD5121, FD5123
 and FD5125
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260622-support-fd5121-from-onsemi-v1-3-b31767689c65@onsemi.com>
References: <20260622-support-fd5121-from-onsemi-v1-0-b31767689c65@onsemi.com>
 <20260622-support-fd5121-from-onsemi-v1-3-b31767689c65@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 06:07:50 +0000
Message-Id: <20260623060751.4CB311F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] Directly exposing PMBUS_PAGE and paged PMBus registers via custom =
lockless sysfs attributes bypasses PMBus core locking and page caching, cau=
sing race conditions and hardware state corruption.
- [High] Incorrect mathematical conversion of READ_VOUT to AMD 6.25mV VIDs =
causes voltage read failures > 1.55V and applies dangerously incorrect volt=
ages on writes.
- [High] The `svr_go` sysfs attribute ignores its mapped register index, al=
lowing userspace to execute arbitrary PMBus/I2C Send Byte commands.
- [High] The I2C block read fallback in `fd5121_read_block_data` corrupts t=
he payload by reading one byte too few and shifting uninitialized memory in=
to the result.
- [High] The I2C block write fallback in `fd5121_write_block_data` omits th=
e required PMBus length byte, corrupting write transactions.
- [Medium] Attempting to read 164/165 bytes for OTP/RAM using standard SMBu=
s/I2C block read functions results in silent truncation to 32 bytes.
- [Medium] `fd5121_word_store` parses user input as a signed 16-bit integer=
, preventing valid unsigned PMBus values from being written.
- [Medium] The custom `clear_faults` sysfs attribute sends an invalid data =
payload for a standard PMBus Send Byte command.
- [Medium] The driver violates the hwmon subsystem ABI by exposing over 80 =
standard PMBus registers as custom raw sysfs attributes.
- [Medium] `fd5121_probe` enforces an overly restrictive `I2C_FUNC_I2C` che=
ck, breaking compatibility with standard SMBus controllers.
--

commit 1e218fd27c0a9b6bb8fade016af8d29cbdb6daa5
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

hwmon: (pmbus/fd5121): Add support FD5121, FD5123 and FD5125
   =20
FD5121 is a dual-rail, multi-phase, digital controller that offers
full telemtry options including input/output voltage, current as
well as fault handling and identifications.
   =20
These controllers are compliant with PMBus specification.

> diff --git a/drivers/hwmon/pmbus/fd5121.c b/drivers/hwmon/pmbus/fd5121.c
> new file mode 100644
> index 0000000000000..e68c6d6cabbd9
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/fd5121.c

[ ... ]

> +static s32 fd5121_read_block_data(const struct i2c_client *client,
> +				  u8 cmd_code, u8 len, u8 *pbuf)
> +{
> +	s32 ret =3D 0;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_READ_BLOCK_DATA)) {
> +
> +		/* Payload length is in the first byte. */
> +		ret =3D i2c_smbus_read_i2c_block_data(client, cmd_code,
> +						    len, pbuf);
> +		if (ret < 0)
> +			return ret;
> +		ret =3D pbuf[0];
> +		if (ret > len)
> +			ret =3D len;
> +		for (int idx =3D 0; idx < ret; idx++)
> +			pbuf[idx] =3D pbuf[idx + 1];
> +		return ret;

[Severity: High]
Does this fallback logic corrupt the payload by reading one byte too few?

Since the device replies with an SMBus block read format (a length byte
followed by the payload), requesting exactly len bytes retrieves the length
byte and only len - 1 data bytes.

This means the last byte of the payload is dropped, and the subsequent
left-shift copies a trailing uninitialized byte into the final payload
position. Should it request len + 1 bytes instead?

[ ... ]

> +static ssize_t fd5121_send_byte_store(struct device *dev,
> +				      struct device_attribute *da,
> +				      const char *buf, size_t count)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev->parent);
> +	u8 val =3D 0;
> +	int ret;
> +
> +	ret =3D kstrtou8(buf, 10, &val);
> +	if (ret < 0)
> +		return ret;
> +	ret =3D i2c_smbus_write_byte(client, val);

[Severity: High]
Does this allow userspace command injection?

This attribute is mapped to PMBUS_REG_MFR_SVR_GO, but it parses the
user-provided string into val and directly sends that as the SMBus command
code, completely ignoring attr->index. This allows any arbitrary command
code to be broadcast instead of SVR_GO.

[ ... ]

> +static ssize_t fd5121_byte_store(struct device *dev,
> +				 struct device_attribute *da,
> +				 const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);
> +	struct i2c_client *client =3D to_i2c_client(dev->parent);
> +	u8 reg =3D attr->index;
> +	int ret =3D 0;
> +	u8 val =3D 0;
> +
> +	switch (reg) {
> +	case PMBUS_REG_MFR_CONFIG_ACTIVATE:
> +		ret =3D fd5121_config_activate(client);
> +		if (ret < 0)
> +			return ret;
> +		return count;
> +	default:
> +		ret =3D kstrtou8(buf, 10, &val);
> +		if (ret < 0)
> +			return ret;
> +		break;
> +	}
> +	if (reg =3D=3D PMBUS_PAGE && ((val !=3D 0 && val !=3D 1 &&
> +	    val !=3D GENMASK(7, 0))))
> +		return -EINVAL;
> +	ret =3D i2c_smbus_write_byte_data(client, reg, val);

[Severity: High]
Can writing to the PMBUS_PAGE attribute directly corrupt the PMBus core's
page tracking?

By modifying the physical hardware's page using raw i2c_smbus_write_byte_da=
ta
instead of the PMBus core accessors, the core's cached data->currpage
becomes out of sync. Subsequent accesses by the PMBus core could execute
on the wrong hardware rail.

[Severity: Medium]
Additionally, if this is used to send PMBUS_CLEAR_FAULTS, does it violate
the PMBus specification?

CLEAR_FAULTS is strictly a Send Byte command with no data payload, but
i2c_smbus_write_byte_data() transmits an extra data byte.

[ ... ]

> +static ssize_t fd5121_word_store(struct device *dev,
> +				 struct device_attribute *da,
> +				 const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);
> +	struct i2c_client *client =3D to_i2c_client(dev->parent);
> +	u8 reg =3D attr->index;
> +	s16 val =3D 0;
> +	int ret =3D 0;
> +
> +	switch (reg) {
> +	case PMBUS_REG_MFR_PWD_PROGRAM_RAM:
> +		val =3D 0xC93F;
> +		break;
> +	default:
> +		ret =3D kstrtos16(buf, 10, &val);

[Severity: Medium]
Does using kstrtos16() prevent configuring valid unsigned PMBus word values?

PMBus word registers represent 16-bit unsigned integers, but parsing
them as a signed s16 causes any valid input between 32768 and 65535 to
be rejected with an -ERANGE error.

[ ... ]

> +static ssize_t fd5121_word_show(struct device *dev,
> +				struct device_attribute *da, char *buf)
> +{
> +	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);
> +	struct i2c_client *client =3D to_i2c_client(dev->parent);
> +	u8 data[I2C_SMBUS_BLOCK_MAX] =3D { 0 };
> +	u8 reg =3D attr->index;
> +	s32 ret =3D 0;
> +
> +	if (fd5121_blk_rd_reg(reg)) {
> +		ret =3D fd5121_read_block_data(client, reg, 2, data);
> +		if (ret >=3D 0)
> +			ret =3D get_unaligned_le16(data);
> +	} else
> +		ret =3D i2c_smbus_read_word_data(client, reg);

[Severity: High]
Does this direct sysfs read lead to a race condition with the PMBus core?

Since these paged registers are read directly via i2c_smbus_read_word_data
without acquiring data->update_lock or ensuring the correct page is active,
concurrent PMBus operations could cause this to read from the wrong rail.

[ ... ]

> +static s32 fd5121_write_block_data(const struct i2c_client *client,
> +				   u8 cmd_code, u8 len, u8 *pbuf)
> +{
> +	s32 ret =3D 0;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_WRITE_BLOCK_DATA))
> +		ret =3D i2c_smbus_write_i2c_block_data(client, cmd_code,
> +						     len, pbuf);

[Severity: High]
Does this I2C block write fallback omit the mandatory PMBus length byte?

Unlike the SMBus equivalent, the I2C block write API does not prepend
a length byte on the wire. Without this length byte, the hardware will
misinterpret the first data byte (pbuf[0]) as the length, corrupting
the data payload.

[ ... ]

> +static ssize_t fd5121_block_show(struct device *dev,
> +				 struct device_attribute *da, char *buf)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev->parent);
> +	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);
> +	u8 buffer[I2C_SMBUS_BLOCK_MAX] =3D { 0 };
> +	u8 reg =3D attr->index;
> +	int printed =3D 0;
> +	s32 ret =3D 0;
> +	u8 len =3D 0;
> +	int i =3D 0;
> +
> +	if (reg =3D=3D PMBUS_REG_MFR_FAULTY_SPS) {
> +		int to_print =3D 0;
> +
> +		len =3D 7;
> +		ret =3D fd5121_read_block_data(client, reg, len, buffer);
> +		if (ret < 0)
> +			return ret;
> +		printed =3D 0;
> +		to_print =3D (ret < len) ? ret : len;
> +		for (i =3D 0; i < to_print; i++)
> +			printed +=3D scnprintf(buf + printed,
> +					     PAGE_SIZE - printed,
> +					     "%02x", buffer[i]);
> +		printed +=3D scnprintf(buf + printed,
> +				     PAGE_SIZE - printed, "\n");
> +		return printed;
> +	} else if (reg =3D=3D PMBUS_REG_BBR_RAM ||
> +		   reg =3D=3D PMBUS_REG_BBR_OTP) {
> +		u32 len =3D (reg =3D=3D PMBUS_REG_BBR_OTP) ? 165 : 164;
> +
> +		/* Extra byte may be needed in case we need to store
> +		 * the length of the data
> +		 */
> +		u8 *tmp_in =3D kcalloc(len+1, sizeof(u8), GFP_KERNEL);
> +
> +		if (tmp_in =3D=3D NULL)
> +			return -ENOMEM;
> +		ret =3D fd5121_read_block_data(client, reg, len, tmp_in);

[Severity: Medium]
Will this operation silently truncate the read to 32 bytes?

The requested lengths are 164 and 165, but the underlying I2C/SMBus
block read functions (i2c_smbus_read_block_data and its I2C fallback)
are strictly capped at I2C_SMBUS_BLOCK_MAX (32 bytes).

[ ... ]

> +static struct attribute *fd5121_paged_attrs[] =3D {
> +	&sensor_dev_attr_operation.dev_attr.attr,
> +	&sensor_dev_attr_vout_raw.dev_attr.attr,
> +	&sensor_dev_attr_on_off_config.dev_attr.attr,
> +	&sensor_dev_attr_clear_faults.dev_attr.attr,
> +	&sensor_dev_attr_write_protect.dev_attr.attr,
> +	&sensor_dev_attr_smbalert_mask.dev_attr.attr,
> +	&sensor_dev_attr_vout_mode.dev_attr.attr,
> +	&sensor_dev_attr_vout_command.dev_attr.attr,

[Severity: Medium]
Is it intentional to expose standard PMBus registers as raw custom sysfs
files here?

Defining over 80 standard PMBus commands (like vout_command, operation,
clear_faults) as custom attributes bypasses the standardized hwmon ABI
(e.g., in1_input). The PMBus core framework automatically translates
these standard features into the required ABI format.

[ ... ]

> +static int fd5121_read_word_data(struct i2c_client *client, int page,
> +				 int phase, int reg)
> +{
> +	int ret;
> +
> +	ret =3D fd5121_valid_reg(client, reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D pmbus_read_word_data(client, page, phase, reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Chip reports VOUT_MODE as vid. But gives raw value 1mV per bit.
> +	 * So, encode the READ_VOUT value so that it gets decoded and
> +	 * reported correctly.
> +	 */
> +	if (reg =3D=3D PMBUS_READ_VOUT)
> +		ret =3D DIV_ROUND_CLOSEST(155000 - ret * 100, 625);
> +	return ret;
> +}

[Severity: High]
Does this calculation fail for voltages above 1.55V?

Since the raw VOUT is 1mV per bit, if ret is greater than 1550, the
numerator (155000 - ret * 100) evaluates to a negative number. The PMBus
core will interpret this negative value as an error code (e.g., -72),
causing sysfs reads to fail.

> +static int fd5121_write_word_data(struct i2c_client *client, int page,
> +				    int reg, u16 word)
> +{
> +	int ret;
> +
> +	ret =3D fd5121_valid_reg(client, reg);
> +	if (ret < 0)
> +		return ret;
> +	ret =3D pmbus_write_word_data(client, page, reg, word);
> +	return ret;
> +}

[Severity: High]
Is there a missing reverse translation for PMBUS_VOUT_COMMAND?

Because info->vrm_version[idx] =3D amd625mv is declared, the PMBus core
translates requested voltages into AMD VIDs and sends them here. Without
an inverse translation to the hardware's native 1mV/bit format, a VID
like 88 would be written directly, severely undervolting the hardware
to 88mV.

[ ... ]

> +static int fd5121_probe(struct i2c_client *client)
> +{
> +	struct pmbus_driver_info *info;
> +	struct fd5121_data *pdata;
> +	u32 id;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
> +		return -EOPNOTSUPP;

[Severity: Medium]
Does this unconditionally break compatibility with pure SMBus controllers?

Many standard PC and server host controllers only support SMBus operations
and do not set the I2C_FUNC_I2C flag. Since the driver heavily utilizes
SMBus commands, checking for full I2C functionality might prevent the driver
from probing on common hardware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622-support-fd=
5121-from-onsemi-v1-0-b31767689c65@onsemi.com?part=3D3
