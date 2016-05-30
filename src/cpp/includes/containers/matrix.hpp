/*
 * matrix.hpp
 *
 *  Created on: May 28, 2016
 *      Author: nick
 */

#ifndef _CPP_INCLUDES_CONTAINERS_MATRIX_HPP_
#define _CPP_INCLUDES_CONTAINERS_MATRIX_HPP_
#include <vector>

template<class T>
class matrix {

protected:

	struct dim {

		unsigned int x;
		unsigned int y;
	};

	std::vector<std::vector<T>> data;
	dim dimensions;

public:
	matrix(unsigned int x_dim, unsigned int y_dim);

	~matrix();

	void add_col(std::vector<T> new_col);

	void add_row(std::vector<T> new_row);

	void add_rows(std::vector<std::vector<T>> new_rows);

	void add_cols(std::vector<std::vector<T>> new_cols);

	void fill(matrix<T> new_data);
	void fill(std::vector<std::vector<T>> new_data);
	void fill(T new_data[][]);

	dim get_dimensions();
};

#endif /* _CPP_INCLUDES_CONTAINERS_MATRIX_HPP_ */
