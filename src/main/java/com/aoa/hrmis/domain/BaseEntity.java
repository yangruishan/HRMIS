/**
 * 
 */
package com.aoa.hrmis.domain;

/**
 * @author douglas
 *
 */
public class BaseEntity {
	
  protected long id;

	public long getId() {
		return id;
	}

	public void setId(long lID) {
		this.id = lID;
	}

//	@Override
//	public int hashCode() {
//		final int prime = 31;
//		int result = 1;
//		result = prime * result + ((id == null) ? 0 : id.hashCode());
//		return result;
//	}
//
//	@Override
//	public boolean equals(Object obj) {
//		if (this == obj)
//			return true;
//		if (obj == null)
//			return false;
//		if (getClass() != obj.getClass())
//			return false;
//		Operator other = (Operator) obj;
//		if (id == null) {
//			if (other.id != null)
//				return false;
//		} else if (!id.equals(other.id))
//			return false;
//		return true;
//	}

}
