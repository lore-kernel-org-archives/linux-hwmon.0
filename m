Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D91833E364
	for <linux-hwmon@vger.kernel.org>; Wed, 19 Nov 2025 09:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763546191; cv=none; b=Or8B8YrSK1ARKjrEq7u4m9QeBSMLSsYfA9FTUEblczW0vzA/sBTBeGm2Kyu9JdUC7y4OX8C74FhNWM8nB2paCxN5JB/zch5IYlDRSefumvDM56VSP7ae/vi50NL71bYgQGx1B6fOPeBA9JtFFhvDuDlAvyKQi/4VhuSND/gF/CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763546191; c=relaxed/simple;
	bh=BTF7RfqL/1x6fsR6SvFSrjj0HsDxryp2IJQUTZDjn0E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t6TkmOk/KdGiY0ZYxG69RevLhspGDCxZ3A1Wu26bUIDnW7XMDHrbS4LYzNLKFbxa3AcnNtZZ7WTibgX72ULMZ04M0+swwMUMRGedrsxsfaHt9Vg6ZCOx1CK6Ddk6nLwuW6bXpSTb+o+Jeu5isDy51RTzIy1aVOhAVNiwntc/vwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FDsyuK8Q; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FDsyuK8Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763546190; x=1795082190;
  h=date:from:to:cc:subject:message-id;
  bh=BTF7RfqL/1x6fsR6SvFSrjj0HsDxryp2IJQUTZDjn0E=;
  b=FDsyuK8QMfeh92kI6LcLRNreLQVVztjtd6xZTWmWDPO7PUKyZHH/wm9f
   MvkqMZeHaWYW3EXopdOWhHGFEmNl5Hjat3HH8n2YubTe3sc9unaZ/oQew
   kRVruezaEfflO5IoWLC16cJNOh1Q20Q9JTKcmfszC2c5QTXkfZCaNZoTy
   ztGGuHI9i04FgLsCR1WN5vwYUULMzaQgoRPqP4RMKq3XRGRwBhJbekuOY
   2D9b/Siefgd2v3qRkiE041O5BUiyUikoZTMlhebnKVBRjhLNfNPmjgpIm
   xKYeNzIWUhrC+sud+ZFN7VdtQRj/5ChgNG7RwLH3qPT2266lwEoPK2eiL
   w==;
X-CSE-ConnectionGUID: 5XnxrnvNT+2TvfK4VZTfow==
X-CSE-MsgGUID: EShNefz1SaOlaF0rLG41mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="77039882"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="77039882"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 01:56:29 -0800
X-CSE-ConnectionGUID: 7fP4NAUSS7G31CjifSbnZw==
X-CSE-MsgGUID: 3wzdrZKyTIGsypGEzruHSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="221921220"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Nov 2025 01:56:28 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLevJ-0002hH-1a;
	Wed, 19 Nov 2025 09:56:25 +0000
Date: Wed, 19 Nov 2025 17:56:24 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging] BUILD SUCCESS
 17ba319e3d8b3df917a5d0109f118fbdac7a73b2
Message-ID: <202511191719.hhofVGMI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
branch HEAD: 17ba319e3d8b3df917a5d0109f118fbdac7a73b2  Merge branch 'hwmon-lock' into hwmon-staging

elapsed time: 7936m

configs tested: 66
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha               allnoconfig    gcc-15.1.0
alpha              allyesconfig    gcc-15.1.0
arc                allmodconfig    gcc-15.1.0
arc                 allnoconfig    gcc-15.1.0
arc                allyesconfig    gcc-15.1.0
arm                 allnoconfig    clang-22
arm64               allnoconfig    gcc-15.1.0
arm64              allyesconfig    clang-22
csky               allmodconfig    gcc-15.1.0
csky                allnoconfig    gcc-15.1.0
csky               allyesconfig    gcc-15.1.0
hexagon            allmodconfig    clang-17
hexagon             allnoconfig    clang-22
hexagon            allyesconfig    clang-22
i386               allmodconfig    gcc-14
i386                allnoconfig    gcc-14
i386               allyesconfig    gcc-14
loongarch          allmodconfig    clang-19
loongarch           allnoconfig    clang-22
loongarch          allyesconfig    clang-22
m68k               allmodconfig    gcc-15.1.0
m68k                allnoconfig    gcc-15.1.0
m68k               allyesconfig    gcc-15.1.0
microblaze         allmodconfig    gcc-15.1.0
microblaze          allnoconfig    gcc-15.1.0
microblaze         allyesconfig    gcc-15.1.0
mips               allmodconfig    gcc-15.1.0
mips                allnoconfig    gcc-15.1.0
mips               allyesconfig    gcc-15.1.0
nios2              allmodconfig    gcc-11.5.0
nios2               allnoconfig    gcc-11.5.0
openrisc           allmodconfig    gcc-15.1.0
openrisc            allnoconfig    gcc-15.1.0
parisc             allmodconfig    gcc-15.1.0
parisc              allnoconfig    gcc-15.1.0
parisc             allyesconfig    gcc-15.1.0
powerpc            allmodconfig    gcc-15.1.0
powerpc             allnoconfig    gcc-15.1.0
riscv              allmodconfig    clang-22
riscv               allnoconfig    gcc-15.1.0
riscv              allyesconfig    clang-16
s390               allmodconfig    clang-18
s390                allnoconfig    clang-22
s390               allyesconfig    gcc-15.1.0
sh                 allmodconfig    gcc-15.1.0
sh                  allnoconfig    gcc-15.1.0
sh                 allyesconfig    gcc-15.1.0
sparc               allnoconfig    gcc-15.1.0
sparc64            allmodconfig    clang-22
sparc64            allyesconfig    gcc-15.1.0
um                 allmodconfig    clang-19
um                  allnoconfig    clang-22
um                 allyesconfig    gcc-14
x86_64             allmodconfig    clang-20
x86_64              allnoconfig    clang-20
x86_64             allyesconfig    clang-20
x86_64                    kexec    clang-20
x86_64                 rhel-9.4    clang-20
x86_64             rhel-9.4-bpf    gcc-14
x86_64            rhel-9.4-func    clang-20
x86_64      rhel-9.4-kselftests    clang-20
x86_64           rhel-9.4-kunit    gcc-14
x86_64             rhel-9.4-ltp    gcc-14
x86_64            rhel-9.4-rust    clang-20
xtensa              allnoconfig    gcc-15.1.0
xtensa             allyesconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
